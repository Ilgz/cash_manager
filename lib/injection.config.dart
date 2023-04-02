// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/application/expense/expense_form/expense_form_cubit.dart'
    as _i12;
import 'package:cash_manager/application/income/income_form/income_form_cubit.dart'
    as _i9;
import 'package:cash_manager/application/transaction/transaction_filter/transaction_filter_cubit.dart'
    as _i10;
import 'package:cash_manager/application/transaction/transaction_watcher/transaction_watcher_cubit.dart'
    as _i11;
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart'
    as _i7;
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i13;
import 'package:cash_manager/infrastructure/transaction/expense_dto.dart'
    as _i5;
import 'package:cash_manager/infrastructure/transaction/income_dto.dart' as _i4;
import 'package:cash_manager/infrastructure/transaction/transaction_repository.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:http/http.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appInjectableProdModule = _$AppInjectableProdModule();
    await gh.factoryAsync<_i3.Box<_i4.IncomeDto>>(
      () => appInjectableProdModule.incomeBox,
      instanceName: 'income',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<_i5.ExpenseDto>>(
      () => appInjectableProdModule.expenseBox,
      instanceName: 'expense',
      preResolve: true,
    );
    gh.lazySingleton<_i6.Client>(() => appInjectableProdModule.httpClient);
    gh.lazySingleton<_i7.ITransactionRepository>(
        () => _i8.TransactionRepository(
              gh<_i3.Box<_i5.ExpenseDto>>(instanceName: 'expense'),
              gh<_i3.Box<_i4.IncomeDto>>(instanceName: 'income'),
            ));
    gh.factory<_i9.IncomeFormCubit>(
        () => _i9.IncomeFormCubit(gh<_i7.ITransactionRepository>()));
    gh.factory<_i10.TransactionFilterCubit>(
        () => _i10.TransactionFilterCubit());
    gh.factory<_i11.TransactionWatcherCubit>(
        () => _i11.TransactionWatcherCubit(gh<_i7.ITransactionRepository>()));
    gh.factory<_i12.ExpenseFormCubit>(
        () => _i12.ExpenseFormCubit(gh<_i7.ITransactionRepository>()));
    return this;
  }
}

class _$AppInjectableProdModule extends _i13.AppInjectableProdModule {}
