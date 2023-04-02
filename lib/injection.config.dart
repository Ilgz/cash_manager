// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cash_manager/application/%20expense/expense_filter/expense_filter_cubit.dart'
    as _i7;
import 'package:cash_manager/application/%20expense/expense_form/expense_form_cubit.dart'
    as _i10;
import 'package:cash_manager/application/%20expense/expense_watcher/expense_watcher_cubit.dart'
    as _i11;
import 'package:cash_manager/domain/transaction/i_transaction_repository.dart'
    as _i8;
import 'package:cash_manager/infrastructure/core/app_injectable_module.dart'
    as _i12;
import 'package:cash_manager/infrastructure/transaction/expense_dto.dart'
    as _i5;
import 'package:cash_manager/infrastructure/transaction/income_dto.dart' as _i4;
import 'package:cash_manager/infrastructure/transaction/transaction_repository.dart'
    as _i9;
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
    gh.factory<_i7.ExpenseFilterCubit>(() => _i7.ExpenseFilterCubit());
    gh.lazySingleton<_i8.ITransactionRepository>(
        () => _i9.TransactionRepository(
              gh<_i3.Box<_i5.ExpenseDto>>(instanceName: 'expense'),
              gh<_i3.Box<_i4.IncomeDto>>(instanceName: 'income'),
            ));
    gh.factory<_i10.ExpenseFormCubit>(
        () => _i10.ExpenseFormCubit(gh<_i8.ITransactionRepository>()));
    gh.factory<_i11.ExpenseWatcherCubit>(
        () => _i11.ExpenseWatcherCubit(gh<_i8.ITransactionRepository>()));
    return this;
  }
}

class _$AppInjectableProdModule extends _i12.AppInjectableProdModule {}
