import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this._expense, {super.key});
  final Expense _expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _expense.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text('\$${_expense.amount.toStringAsFixed(2)}'),
                    const Spacer(),
                    Icon(categoryIcons[_expense.category]),
                    const SizedBox(width: 9),
                    Text(_expense.dateFormatter())
                  ],
                )
              ],
            )));
  }
}
