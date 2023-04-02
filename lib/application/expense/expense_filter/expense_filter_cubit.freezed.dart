// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpenseFilterState {
  List<Expense> get expenses => throw _privateConstructorUsedError;
  int get monthIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseFilterStateCopyWith<ExpenseFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseFilterStateCopyWith<$Res> {
  factory $ExpenseFilterStateCopyWith(
          ExpenseFilterState value, $Res Function(ExpenseFilterState) then) =
      _$ExpenseFilterStateCopyWithImpl<$Res, ExpenseFilterState>;
  @useResult
  $Res call({List<Expense> expenses, int monthIndex});
}

/// @nodoc
class _$ExpenseFilterStateCopyWithImpl<$Res, $Val extends ExpenseFilterState>
    implements $ExpenseFilterStateCopyWith<$Res> {
  _$ExpenseFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? monthIndex = null,
  }) {
    return _then(_value.copyWith(
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      monthIndex: null == monthIndex
          ? _value.monthIndex
          : monthIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseFilterStateCopyWith<$Res>
    implements $ExpenseFilterStateCopyWith<$Res> {
  factory _$$_ExpenseFilterStateCopyWith(_$_ExpenseFilterState value,
          $Res Function(_$_ExpenseFilterState) then) =
      __$$_ExpenseFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Expense> expenses, int monthIndex});
}

/// @nodoc
class __$$_ExpenseFilterStateCopyWithImpl<$Res>
    extends _$ExpenseFilterStateCopyWithImpl<$Res, _$_ExpenseFilterState>
    implements _$$_ExpenseFilterStateCopyWith<$Res> {
  __$$_ExpenseFilterStateCopyWithImpl(
      _$_ExpenseFilterState _value, $Res Function(_$_ExpenseFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenses = null,
    Object? monthIndex = null,
  }) {
    return _then(_$_ExpenseFilterState(
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      monthIndex: null == monthIndex
          ? _value.monthIndex
          : monthIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ExpenseFilterState implements _ExpenseFilterState {
  const _$_ExpenseFilterState(
      {required final List<Expense> expenses, required this.monthIndex})
      : _expenses = expenses;

  final List<Expense> _expenses;
  @override
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  @override
  final int monthIndex;

  @override
  String toString() {
    return 'ExpenseFilterState(expenses: $expenses, monthIndex: $monthIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseFilterState &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            (identical(other.monthIndex, monthIndex) ||
                other.monthIndex == monthIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_expenses), monthIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseFilterStateCopyWith<_$_ExpenseFilterState> get copyWith =>
      __$$_ExpenseFilterStateCopyWithImpl<_$_ExpenseFilterState>(
          this, _$identity);
}

abstract class _ExpenseFilterState implements ExpenseFilterState {
  const factory _ExpenseFilterState(
      {required final List<Expense> expenses,
      required final int monthIndex}) = _$_ExpenseFilterState;

  @override
  List<Expense> get expenses;
  @override
  int get monthIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseFilterStateCopyWith<_$_ExpenseFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
