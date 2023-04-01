import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'expense.freezed.dart';
@freezed
abstract class Expense implements _$Expense {
  Expense._();
  static final List<ExpenseCategory> categories = [
    ExpenseCategory('Food & Drink',Icons.fastfood_outlined,Color(0xff6765df)),
    ExpenseCategory('Entertainment',Icons.movie_outlined,Colors.red),
    ExpenseCategory('Transportation',Icons.directions_bus_outlined,Color(0xfffeaf02)),
    ExpenseCategory('Housing',Icons.house_outlined,Colors.brown),
    ExpenseCategory('Utilities',Icons.build_outlined,Colors.blue),
    ExpenseCategory('Shopping',Icons.shopping_bag_outlined,Color(0xfff27d1e)),
    ExpenseCategory('Education',Icons.school_outlined,Colors.lightGreenAccent),
    ExpenseCategory('Healthcare',Icons.local_hospital_outlined,Colors.green),
    ExpenseCategory('Travel',Icons.flight_outlined,Color(0xff00b6e4)),
    ExpenseCategory('Other',Icons.more_horiz_outlined,Colors.grey)
  ];
  factory Expense({
    required ExpenseName expenseName,
    required int category,
    required Amount amount,
    required DateTime date,
  }) = _Expense;

  factory Expense.empty() {
    return Expense(
        expenseName: ExpenseName(""),
        category: 0,
        amount: Amount(0),
        date: DateTime.now());
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return expenseName.failureOrUnit.andThen(amount.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }
}
