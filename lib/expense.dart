import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: Column(
      children: [Text("Expense Tracker")],
    ),),);
  }
}
