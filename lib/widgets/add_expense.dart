import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(context) {
    return const Padding(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }
}
