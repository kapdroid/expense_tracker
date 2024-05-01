import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  final _amoutEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    _amoutEditingController.dispose();
    super.dispose();
  }

  void _selectExpenseDate() {
    final now = DateTime.now();
    showDatePicker(
        context: context,
        firstDate: DateTime(now.year-1,now.month,now.day),
        lastDate: DateTime.now());
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
            maxLength: 50,
            keyboardType: TextInputType.multiline,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                    controller: _amoutEditingController,
                    decoration: const InputDecoration(
                        label: Text("Amount "), prefixText: "\$ "),
                    maxLength: 6,
                    keyboardType: TextInputType.number),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Select Date"),
                    IconButton(
                        onPressed:_selectExpenseDate,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              ),
              // IconButton(
              //     onPressed: () {}, icon: const Icon(Icons.calendar_month))
            ],
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    print(_textEditingController.text);
                    print(_amoutEditingController.text);
                  },
                  child: const Text("Add Expense"))
            ],
          )
        ],
      ),
    );
  }
}
