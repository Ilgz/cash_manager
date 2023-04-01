import 'package:cash_manager/domain/core/failures.dart';
import 'package:cash_manager/domain/core/value_objects.dart';
import 'package:cash_manager/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ExpenseName extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory ExpenseName(String input){
    return ExpenseName._(validateStringNotEmpty(input).andThen(validateMaxStringLength(input, 50)));
  }
  const ExpenseName._(this.value);
}

class IncomeName extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String>  value;
  factory IncomeName(String input){
    return IncomeName._(validateStringNotEmpty(input).andThen(validateMaxStringLength(input, 50)));
  }
  const IncomeName._(this.value);
}
class Amount extends ValueObject<double>{
  @override
  final Either<ValueFailure<double>, double>  value;
  factory Amount(double amount){
    return Amount._(validateAmountIsGreaterThanZero(amount));
  }
  const Amount._(this.value);
}