import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/core/value_objects.dart';
import 'package:cash_manager/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
class TransactionName extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory TransactionName(String input){
    return TransactionName._(validateStringNotEmpty(input).andThen(validateMaxStringLength(input, 50)));
  }
  const TransactionName._(this.value);
}
class Amount extends ValueObject<double>{
  @override
  final Either<ValueFailure<double>, double>  value;
  factory Amount(double amount){
    return Amount._(validateAmountIsGreaterThanZero(amount));
  }
  const Amount._(this.value);
}