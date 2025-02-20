import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import 'package:u07_features_placesapp/models/place.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        '''
            CREATE TABLE user_places(
            id TEXT PRIMARY KEY,
            title TEXT,
            image TEXT,
            latitude REAL,
            longitude REAL,
            address TEXT
            )
          ''',
      );
    },
    version: 1,
  );
  return db;
}

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data
        .map(
          (row) => Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            location: PlaceLocation(
                latitude: row['latitude'] as double,
                longitude: row['longitude'] as double,
                address: row['address'] as String),
          ),
        )
        .toList();

    state = places;
  }

  Future<void> addPlace({
    required String title,
    required File image,
    required PlaceLocation location,
  }) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);

    final db = await _getDatabase();
    db.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'latitude': newPlace.location.latitude,
        'longitude': newPlace.location.longitude,
        'address': newPlace.location.address,
      },
    );

    state = [newPlace, ...state];
  }

  Future<void> removePlace(Place place) async {
    final db = await _getDatabase();
    await db.delete(
      'user_places',
      where: 'id = ?',
      whereArgs: [place.id],
    );

    final imageFile = File(place.image.path);
    if (await imageFile.exists()) {
      await imageFile.delete();
    }

    state = state.where((statePlace) => statePlace.id != place.id).toList();
  }

  Future<void> insertPlace(
    int index, {
    String? id,
    required String title,
    required File image,
    required PlaceLocation location,
  }) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');
    final newPlace =
        Place(id: id, title: title, image: copiedImage, location: location);

    final db = await _getDatabase();
    await db.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'latitude': newPlace.location.latitude,
        'longitude': newPlace.location.longitude,
        'address': newPlace.location.address,
      },
    );

    final newState = List<Place>.from(state);
    newState.insert(index, newPlace);
    state = newState;
  }
}

final placesProvider =
    StateNotifierProvider<PlacesNotifier, List<Place>>((ref) {
  return PlacesNotifier();
});
