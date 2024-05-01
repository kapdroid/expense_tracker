import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        dateTime: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 15.69,
        dateTime: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Travel",
        amount: 11.99,
        dateTime: DateTime.now(),
        category: Category.travel)
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          const Text("Expense Tracker"),
          ExpenseList(_registeredExpenses)
        ],
      )),
    );
  }
}
