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
  static final List<Category> categories = [
    Category('Food & Drink',Icons.fastfood_outlined,Color(0xff6765df)),
    Category('Entertainment',Icons.movie_outlined,Colors.red),
    Category('Transportation',Icons.directions_bus_outlined,Color(0xfffeaf02)),
    Category('Housing',Icons.house_outlined,Colors.brown),
    Category('Utilities',Icons.build_outlined,Colors.blue),
    Category('Shopping',Icons.shopping_bag_outlined,Color(0xfff27d1e)),
    Category('Education',Icons.school_outlined,Colors.lightGreenAccent),
    Category('Healthcare',Icons.local_hospital_outlined,Colors.green[100]!),
    Category('Travel',Icons.flight_outlined,Color(0xff00b6e4)),
    Category('Other',Icons.more_horiz_outlined,Colors.grey)
  ];
  factory Expense({
    required TransactionName name,
    required int category,
    required Amount amount,
    required DateTime date,
  }) = _Expense;

  factory Expense.empty() {
    return Expense(
        name: TransactionName(""),
        category: 0,
        amount: Amount(0),
        date: DateTime.now());
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.andThen(amount.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }
}
