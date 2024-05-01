import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  String _expenseTitle = "";

  void _saveTitleInput(String input) {
    _expenseTitle = input;
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            decoration: const InputDecoration(label: Text("Title")),
            maxLength: 50,
            keyboardType: TextInputType.multiline,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_expenseTitle);
                  },
                  child: const Text("Add Expense"))
            ],
          )
        ],
      ),
    );
  }
}
