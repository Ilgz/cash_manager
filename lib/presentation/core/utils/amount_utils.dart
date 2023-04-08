import 'package:cash_manager/domain/core/transaction.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';

String getAmountWithTransactionSignifier(Transaction transaction){
  String transactionSignifier=transaction.isIncome?"+":"-";
  return "$transactionSignifier\$${transaction.amount.getOrCrash()}";
}