// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomeFormState {
  Income get income => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<TransactionFailure, Unit>> get authFailureSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeFormStateCopyWith<IncomeFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeFormStateCopyWith<$Res> {
  factory $IncomeFormStateCopyWith(
          IncomeFormState value, $Res Function(IncomeFormState) then) =
      _$IncomeFormStateCopyWithImpl<$Res, IncomeFormState>;
  @useResult
  $Res call(
      {Income income,
      bool showErrorMessages,
      Option<Either<TransactionFailure, Unit>> authFailureSuccessOption});

  $IncomeCopyWith<$Res> get income;
}

/// @nodoc
class _$IncomeFormStateCopyWithImpl<$Res, $Val extends IncomeFormState>
    implements $IncomeFormStateCopyWith<$Res> {
  _$IncomeFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? showErrorMessages = null,
    Object? authFailureSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Income,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureSuccessOption: null == authFailureSuccessOption
          ? _value.authFailureSuccessOption
          : authFailureSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TransactionFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IncomeCopyWith<$Res> get income {
    return $IncomeCopyWith<$Res>(_value.income, (value) {
      return _then(_value.copyWith(income: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExpenseFormStateCopyWith<$Res>
    implements $IncomeFormStateCopyWith<$Res> {
  factory _$$_ExpenseFormStateCopyWith(
          _$_ExpenseFormState value, $Res Function(_$_ExpenseFormState) then) =
      __$$_ExpenseFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Income income,
      bool showErrorMessages,
      Option<Either<TransactionFailure, Unit>> authFailureSuccessOption});

  @override
  $IncomeCopyWith<$Res> get income;
}

/// @nodoc
class __$$_ExpenseFormStateCopyWithImpl<$Res>
    extends _$IncomeFormStateCopyWithImpl<$Res, _$_ExpenseFormState>
    implements _$$_ExpenseFormStateCopyWith<$Res> {
  __$$_ExpenseFormStateCopyWithImpl(
      _$_ExpenseFormState _value, $Res Function(_$_ExpenseFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? showErrorMessages = null,
    Object? authFailureSuccessOption = null,
  }) {
    return _then(_$_ExpenseFormState(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as Income,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureSuccessOption: null == authFailureSuccessOption
          ? _value.authFailureSuccessOption
          : authFailureSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<TransactionFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ExpenseFormState implements _ExpenseFormState {
  const _$_ExpenseFormState(
      {required this.income,
      required this.showErrorMessages,
      required this.authFailureSuccessOption});

  @override
  final Income income;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<TransactionFailure, Unit>> authFailureSuccessOption;

  @override
  String toString() {
    return 'IncomeFormState(income: $income, showErrorMessages: $showErrorMessages, authFailureSuccessOption: $authFailureSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseFormState &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(
                    other.authFailureSuccessOption, authFailureSuccessOption) ||
                other.authFailureSuccessOption == authFailureSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, income, showErrorMessages, authFailureSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseFormStateCopyWith<_$_ExpenseFormState> get copyWith =>
      __$$_ExpenseFormStateCopyWithImpl<_$_ExpenseFormState>(this, _$identity);
}

abstract class _ExpenseFormState implements IncomeFormState {
  const factory _ExpenseFormState(
      {required final Income income,
      required final bool showErrorMessages,
      required final Option<Either<TransactionFailure, Unit>>
          authFailureSuccessOption}) = _$_ExpenseFormState;

  @override
  Income get income;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<TransactionFailure, Unit>> get authFailureSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseFormStateCopyWith<_$_ExpenseFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
