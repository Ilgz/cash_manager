import 'dart:math';

import 'package:cash_manager/domain/transaction/expense.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'income_dto.freezed.dart';
part 'income_dto.g.dart';
@freezed
abstract class IncomeDto implements _$IncomeDto {
  IncomeDto._();
  @HiveType(typeId: 1)
  factory IncomeDto({
    @HiveField(3)
    required String incomeName,
    @HiveField(0)
    required double amount,
    @HiveField(1)
    required DateTime date,
  }) = _IncomeDto;

  factory IncomeDto.fromDomain(Income income) =>
      IncomeDto(incomeName:income.incomeName.getOrCrash(),
          amount:income.amount.getOrCrash(), date: income.date);
  Income toDomain() {
    return Income(incomeName: IncomeName(incomeName),amount: Amount(amount),date: date);
  }
}