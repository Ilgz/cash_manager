
import 'package:cash_manager/domain/core/failures.dart';

class NotAuthenticatedError extends Error{}
class UnexpectedValueError extends Error{
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);
@override
  String toString() {
    return "Encountered a valueFailure at an unrecoverable point. Terminating. Failure was: $valueFailure";
  }
}

class UnexpectedProjectError extends Error{
  @override
  String toString() {
    return "Encountered a projectFailure could not find candidates.";
  }
}