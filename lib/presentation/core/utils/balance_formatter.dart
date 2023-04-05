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
