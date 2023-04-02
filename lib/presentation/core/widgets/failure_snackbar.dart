import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:flutter/material.dart';

class FailureSnackBar extends SnackBar {
   FailureSnackBar({super.key, required this.failure}) : super(content:Text(failure.map(
      unexpected: (_) => "Unexpected error while updating...",
   )) ) ;
  final TransactionFailure failure;
}
