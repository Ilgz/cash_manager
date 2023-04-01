// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpenseDto {
  @HiveField(3)
  String get expenseName => throw _privateConstructorUsedError;
  @HiveField(4)
  int get category => throw _privateConstructorUsedError;
  @HiveField(0)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpenseDtoCopyWith<ExpenseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseDtoCopyWith<$Res> {
  factory $ExpenseDtoCopyWith(
          ExpenseDto value, $Res Function(ExpenseDto) then) =
      _$ExpenseDtoCopyWithImpl<$Res, ExpenseDto>;
  @useResult
  $Res call(
      {@HiveField(3) String expenseName,
      @HiveField(4) int category,
      @HiveField(0) double amount,
      @HiveField(1) DateTime date});
}

/// @nodoc
class _$ExpenseDtoCopyWithImpl<$Res, $Val extends ExpenseDto>
    implements $ExpenseDtoCopyWith<$Res> {
  _$ExpenseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseName = null,
    Object? category = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      expenseName: null == expenseName
          ? _value.expenseName
          : expenseName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseDtoCopyWith<$Res>
    implements $ExpenseDtoCopyWith<$Res> {
  factory _$$_ExpenseDtoCopyWith(
          _$_ExpenseDto value, $Res Function(_$_ExpenseDto) then) =
      __$$_ExpenseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(3) String expenseName,
      @HiveField(4) int category,
      @HiveField(0) double amount,
      @HiveField(1) DateTime date});
}

/// @nodoc
class __$$_ExpenseDtoCopyWithImpl<$Res>
    extends _$ExpenseDtoCopyWithImpl<$Res, _$_ExpenseDto>
    implements _$$_ExpenseDtoCopyWith<$Res> {
  __$$_ExpenseDtoCopyWithImpl(
      _$_ExpenseDto _value, $Res Function(_$_ExpenseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseName = null,
    Object? category = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$_ExpenseDto(
      expenseName: null == expenseName
          ? _value.expenseName
          : expenseName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$_ExpenseDto extends _ExpenseDto {
  _$_ExpenseDto(
      {@HiveField(3) required this.expenseName,
      @HiveField(4) required this.category,
      @HiveField(0) required this.amount,
      @HiveField(1) required this.date})
      : super._();

  @override
  @HiveField(3)
  final String expenseName;
  @override
  @HiveField(4)
  final int category;
  @override
  @HiveField(0)
  final double amount;
  @override
  @HiveField(1)
  final DateTime date;

  @override
  String toString() {
    return 'ExpenseDto(expenseName: $expenseName, category: $category, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseDto &&
            (identical(other.expenseName, expenseName) ||
                other.expenseName == expenseName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, expenseName, category, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseDtoCopyWith<_$_ExpenseDto> get copyWith =>
      __$$_ExpenseDtoCopyWithImpl<_$_ExpenseDto>(this, _$identity);
}

abstract class _ExpenseDto extends ExpenseDto {
  factory _ExpenseDto(
      {@HiveField(3) required final String expenseName,
      @HiveField(4) required final int category,
      @HiveField(0) required final double amount,
      @HiveField(1) required final DateTime date}) = _$_ExpenseDto;
  _ExpenseDto._() : super._();

  @override
  @HiveField(3)
  String get expenseName;
  @override
  @HiveField(4)
  int get category;
  @override
  @HiveField(0)
  double get amount;
  @override
  @HiveField(1)
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseDtoCopyWith<_$_ExpenseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
