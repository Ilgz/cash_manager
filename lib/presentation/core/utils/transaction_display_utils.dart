import 'package:cash_manager/domain/core/transaction.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';

String getAmountWithTransactionSignifier(Transaction transaction){
  String transactionSignifier=transaction.isIncome?"+":"-";
  return "$transactionSignifier\$${transaction.amount.getOrCrash()}";
}
String formatBalance(double balance) {
  String result = balance.abs().toInt().toString();

  String delimiter = ",";
  int i = (result.length - 3);

  while (i > 0) {
    result = result.substring(0, i) + delimiter + result.substring(i);
    i -= 3;
  }
  if (balance < 0) {
    result = "-$result";
  }

  return result;
}