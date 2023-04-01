  import 'package:cash_manager/domain/core/errors.dart';
import 'package:cash_manager/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;
  T getOrCrash(){
    //id=identity same as writing (right)=> right
    return value.fold((f) => throw UnexpectedValueError(f),id );
  }
  String  isNewOrFailureStr(bool isNew){
    return value.fold(
            (f) => isNew
            ? ""
            : throw UnexpectedValueError(f),
        (r)=>r.toString());
  }

  Either<ValueFailure<dynamic>,Unit>get failureOrUnit{
  return value.fold((l) => left(l), (r) => right(unit));
  }
  bool isValid()=>value.isRight();
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
