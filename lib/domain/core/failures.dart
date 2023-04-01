import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';
@freezed
abstract class  ValueFailure<T> with _$ValueFailure<T>{
  factory ValueFailure.empty({required T failedValue})=_Empty<T>;
  factory ValueFailure.isLessThanZero({required T failedValue})=_LessThanZero<T>;
  factory ValueFailure.exceedingLength({required T failedValue,required int max})=_ExceedingLength<T>;
}
