import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'income.freezed.dart';
@freezed
abstract class Income implements _$Income {
  Income._();
  factory Income({
    required IncomeName incomeName,
    required Amount amount,
    required DateTime date,
  }) = _Income;

  factory Income.empty() {
    return Income(
        incomeName: IncomeName(""),
        amount: Amount(0),
        date: DateTime.now());
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return incomeName.failureOrUnit
        .fold((l) => some(ValueFailure.empty(failedValue: "")), (r) => none());
  }
}
