part of 'transaction_filter_cubit.dart';


@freezed
class TransactionFilterState with _$TransactionFilterState {
  factory TransactionFilterState.initial() =>TransactionFilterState(transactions: [], monthIndex: DateTime.now().month-1);
  const factory TransactionFilterState({required List<Either<Expense,Income>> transactions,required int monthIndex})= _TransactionFilterState;

}