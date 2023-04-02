import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:cash_manager/domain/transaction/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'income_form_state.dart';
part 'income_form_cubit.freezed.dart';
@injectable
class IncomeFormCubit extends Cubit<IncomeFormState> {
  final ITransactionRepository transactionRepository;
  IncomeFormCubit(this.transactionRepository) : super( IncomeFormState.initial());
  void initialize(Income? income){
    emit(state.copyWith(income: income??Income.empty()));
  }
  void amountChanged(String amount) {
    emit(state.copyWith(
        income: state.income.copyWith(amount: Amount(double.tryParse(amount)??0)),
        authFailureSuccessOption: none()));
  }

  void nameChanged(String incomeName) {
    emit(state.copyWith(
        income: state.income.copyWith(incomeName: IncomeName(incomeName)),
        authFailureSuccessOption: none()));
  }
  createIncome() async {
    if (state.income.failureOption.isNone()) {
      final value=await transactionRepository.createIncome(state.income);
      emit(state.copyWith(authFailureSuccessOption: some(value.fold((f) =>left(f), (_) => right(unit)))));
    }
    emit(state.copyWith(showErrorMessages: true));
  }
  Future<void> updateIncome(Income oldIncome)async{
    if (state.income.failureOption.isNone()) {
      final value=await transactionRepository.updateIncome(oldIncome,state.income);
      emit(state.copyWith(authFailureSuccessOption: some(value.fold((f) =>left(f), (_) => right(unit)))));
    }
    emit(state.copyWith(showErrorMessages: true));
  }
  Future<void> deleteIncome(Income income)async{
    if (state.income.failureOption.isNone()) {
      final value=await transactionRepository.deleteIncome(income);
      emit(state.copyWith(authFailureSuccessOption: some(value.fold((f) =>left(f), (_) => right(unit)))));
    }
    emit(state.copyWith(showErrorMessages: true));
  }
}
