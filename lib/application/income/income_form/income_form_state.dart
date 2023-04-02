part of 'income_form_cubit.dart';


@freezed
class IncomeFormState with _$IncomeFormState {
  factory IncomeFormState.initial() => IncomeFormState(income:Income.empty(), showErrorMessages: false, authFailureSuccessOption: none());
  const factory IncomeFormState({required Income income,required bool showErrorMessages,required Option<Either<TransactionFailure,Unit>> authFailureSuccessOption})= _ExpenseFormState;
}
