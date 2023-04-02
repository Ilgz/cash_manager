// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionFilterState {
  List<Either<Expense, Income>> get transactions =>
      throw _privateConstructorUsedError;
  int get monthIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionFilterStateCopyWith<TransactionFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFilterStateCopyWith<$Res> {
  factory $TransactionFilterStateCopyWith(TransactionFilterState value,
          $Res Function(TransactionFilterState) then) =
      _$TransactionFilterStateCopyWithImpl<$Res, TransactionFilterState>;
  @useResult
  $Res call({List<Either<Expense, Income>> transactions, int monthIndex});
}

/// @nodoc
class _$TransactionFilterStateCopyWithImpl<$Res,
        $Val extends TransactionFilterState>
    implements $TransactionFilterStateCopyWith<$Res> {
  _$TransactionFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? monthIndex = null,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Either<Expense, Income>>,
      monthIndex: null == monthIndex
          ? _value.monthIndex
          : monthIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionFilterStateCopyWith<$Res>
    implements $TransactionFilterStateCopyWith<$Res> {
  factory _$$_TransactionFilterStateCopyWith(_$_TransactionFilterState value,
          $Res Function(_$_TransactionFilterState) then) =
      __$$_TransactionFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Either<Expense, Income>> transactions, int monthIndex});
}

/// @nodoc
class __$$_TransactionFilterStateCopyWithImpl<$Res>
    extends _$TransactionFilterStateCopyWithImpl<$Res,
        _$_TransactionFilterState>
    implements _$$_TransactionFilterStateCopyWith<$Res> {
  __$$_TransactionFilterStateCopyWithImpl(_$_TransactionFilterState _value,
      $Res Function(_$_TransactionFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? monthIndex = null,
  }) {
    return _then(_$_TransactionFilterState(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Either<Expense, Income>>,
      monthIndex: null == monthIndex
          ? _value.monthIndex
          : monthIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TransactionFilterState implements _TransactionFilterState {
  const _$_TransactionFilterState(
      {required final List<Either<Expense, Income>> transactions,
      required this.monthIndex})
      : _transactions = transactions;

  final List<Either<Expense, Income>> _transactions;
  @override
  List<Either<Expense, Income>> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final int monthIndex;

  @override
  String toString() {
    return 'TransactionFilterState(transactions: $transactions, monthIndex: $monthIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionFilterState &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.monthIndex, monthIndex) ||
                other.monthIndex == monthIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), monthIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionFilterStateCopyWith<_$_TransactionFilterState> get copyWith =>
      __$$_TransactionFilterStateCopyWithImpl<_$_TransactionFilterState>(
          this, _$identity);
}

abstract class _TransactionFilterState implements TransactionFilterState {
  const factory _TransactionFilterState(
      {required final List<Either<Expense, Income>> transactions,
      required final int monthIndex}) = _$_TransactionFilterState;

  @override
  List<Either<Expense, Income>> get transactions;
  @override
  int get monthIndex;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionFilterStateCopyWith<_$_TransactionFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
