import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddExpense extends StatefulWidget {
  const AddExpense(Function(Expense) this.onAdd, {super.key});

  final void Function(Expense) onAdd;

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  String _expenseTitle = "";
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  final _textEditingController = TextEditingController();
  final _amoutEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    _amoutEditingController.dispose();
    super.dispose();
  }

  void _selectExpenseDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: DateTime.now());

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _selectCategory(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: ((context, constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 4, keyboardSpace + 4),
            child: Column(
              children: [
                if (width > 600)
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                          ),
                          maxLength: 50,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                            controller: _amoutEditingController,
                            decoration: const InputDecoration(
                                label: Text("Amount "), prefixText: "\$ "),
                            maxLength: 6,
                            keyboardType: TextInputType.number),
                      ),
                    ],
                  )
                else
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
                    if (width > 600)
                      DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item.name.toUpperCase()),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            _selectCategory(value as Category);
                          })
                    else
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
                          Text(_selectedDate == null
                              ? "No Date Selected"
                              : formatter.format(_selectedDate!)),
                          IconButton(
                              onPressed: _selectExpenseDate,
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                    ),
                    // IconButton(
                    //     onPressed: () {}, icon: const Icon(Icons.calendar_month))
                    if (width > 600)
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                    if (width > 600)
                      ElevatedButton(
                          onPressed: validateInputs,
                          child: const Text("Add Expense"))
                  ],
                ),
                if (width <= 600)
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item.name.toUpperCase()),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            _selectCategory(value as Category);
                          }),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      ElevatedButton(
                          onPressed: validateInputs,
                          child: const Text("Add Expense"))
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    }));
  }

  void validateInputs() {
    final titleValid = _textEditingController.text.trim().isNotEmpty;
    final amountValid = _amoutEditingController.text.isNotEmpty &&
        double.parse(_amoutEditingController.text) >= 0;
    final dateValid = _selectedDate != null;
    final categoryValid = _selectedCategory != null;
    if (!(titleValid && amountValid && dateValid && categoryValid)) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Inputs"),
          content:
              const Text("Please enter valid date category title and amount "),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"))
          ],
        ),
      );   
    
      // to know platform is IOS or android  use Platform.isIOS;
      // use instead of showDialog showCupertinoDialog(context: context, builder: builder) to show ios specific dialog
      // and from AlertDialog to CupertinoAlertDialog
      
     
    }
    widget.onAdd(Expense(
        title: _textEditingController.text,
        amount: double.parse(_amoutEditingController.text),
        dateTime: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
    return;
  }
}


