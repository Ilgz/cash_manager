import 'package:cash_manager/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
Either<ValueFailure<String>, String> validateStringNotEmpty(String input){
if(input.trim().isNotEmpty){
  return right(input);
}else{
  return left(ValueFailure.empty(failedValue: input));
}
}
Either<ValueFailure<double>, double> validateAmountIsGreaterThanZero(double amount){
  if(amount>0){
    return right(amount);
  }else{
    return left(ValueFailure.isLessThanZero(failedValue: amount));
  }
}
Either<ValueFailure<String>,String> validateMaxStringLength(String input,int maxLength){
  if(input.length<=maxLength){
    return right(input);
  }else{
    return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  }
}
