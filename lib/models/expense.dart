import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  Expense(
      {required this.name,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String name;
  final double amount;
  final DateTime dateTime;
  final Category category;
}
