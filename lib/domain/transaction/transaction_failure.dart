import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_failure.freezed.dart';
@freezed
abstract class TransactionFailure with _$TransactionFailure{
  const factory TransactionFailure.unexpected()=_Unexpected;
}