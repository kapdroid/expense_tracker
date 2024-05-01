import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/item_expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this._expenseList, this.removeExpense, {super.key});

  final List<Expense> _expenseList;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: _expenseList.length,
            itemBuilder: (ctx, index) => Dismissible(
                  key: ValueKey(_expenseList[index]),
                  child: ExpenseItem(_expenseList[index]),
                  onDismissed: (direction) {
                    removeExpense(_expenseList[index]);
                  },
                )));
  }
}
