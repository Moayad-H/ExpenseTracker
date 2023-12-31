import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.work: Icons.work,
  Category.food: Icons.food_bank_sharp,
  Category.leisure: Icons.movie_creation_rounded,
  Category.travel: Icons.flight_takeoff
};

class Expense {
  Expense(
      {required this.amount,
      required this.dateTime,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
  String get formattedDate {
    return formatter.format(dateTime);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  final Category category;
  final List<Expense> expenses;
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses =
            allExpenses.where((exp) => exp.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (var element in expenses) {
      sum += element.amount;
    }
    return sum;
  }
}
