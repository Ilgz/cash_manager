import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/transaction/category.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income.freezed.dart';
@freezed
abstract class Income implements _$Income {
  Income._();
  static const  Category incomeCategory= Category(
  "Income",
  Icons.attach_money,
  Color(0xff129231));
  factory Income({
    required TransactionName name,
    required Amount amount,
    required DateTime date,
  }) = _Income;

  factory Income.empty() {
    return Income(
        name: TransactionName(""),
        amount: Amount(0),
        date: DateTime.now());
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .fold((l) => some(ValueFailure.empty(failedValue: "")), (r) => none());
  }
}
