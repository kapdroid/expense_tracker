import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this._expenseList, {super.key});

  final List<Expense> _expenseList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: _expenseList.length,
            itemBuilder: (ctx, index) => Text(_expenseList[index].name)));
  }
}
