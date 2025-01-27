import 'package:flutter/material.dart';

import 'package:u04_interactivity/models/expense.dart';
import 'package:u04_interactivity/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: () {},
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
