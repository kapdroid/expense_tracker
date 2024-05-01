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

  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(label: Text("Title")),
            maxLength: 50,
            keyboardType: TextInputType.multiline,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_textEditingController.text);
                  },
                  child: const Text("Add Expense"))
            ],
          )
        ],
      ),
    );
  }
}
