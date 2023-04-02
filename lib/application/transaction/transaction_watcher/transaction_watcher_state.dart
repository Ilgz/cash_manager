part of 'transaction_watcher_cubit.dart';

@freezed
class TransactionWatcherState with _$TransactionWatcherState {
  const factory TransactionWatcherState.initial() = _Initial;
  const factory TransactionWatcherState.loadInProgress()=_LoadInProgress;
  const factory TransactionWatcherState.loadSuccess(List<Either<Expense,Income>> transactionData )=_LoadSuccess;
  const factory TransactionWatcherState.loadFailure(TransactionFailure transactionFailure)=_LoadFailure;
}
