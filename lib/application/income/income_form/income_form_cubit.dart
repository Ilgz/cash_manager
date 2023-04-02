import 'package:bloc/bloc.dart';
import 'package:cash_manager/domain/transaction/income.dart';
import 'package:cash_manager/domain/transaction/transaction_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_form_state.dart';
part 'income_form_cubit.freezed.dart';

class IncomeFormCubit extends Cubit<IncomeFormState> {
  IncomeFormCubit() : super( IncomeFormState.initial());
}
