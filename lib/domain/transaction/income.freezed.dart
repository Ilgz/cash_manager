// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Income {
  IncomeName get incomeName => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeCopyWith<Income> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) then) =
      _$IncomeCopyWithImpl<$Res, Income>;
  @useResult
  $Res call({IncomeName incomeName, Amount amount, DateTime date});
}

/// @nodoc
class _$IncomeCopyWithImpl<$Res, $Val extends Income>
    implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeName = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      incomeName: null == incomeName
          ? _value.incomeName
          : incomeName // ignore: cast_nullable_to_non_nullable
              as IncomeName,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomeCopyWith<$Res> implements $IncomeCopyWith<$Res> {
  factory _$$_IncomeCopyWith(_$_Income value, $Res Function(_$_Income) then) =
      __$$_IncomeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IncomeName incomeName, Amount amount, DateTime date});
}

/// @nodoc
class __$$_IncomeCopyWithImpl<$Res>
    extends _$IncomeCopyWithImpl<$Res, _$_Income>
    implements _$$_IncomeCopyWith<$Res> {
  __$$_IncomeCopyWithImpl(_$_Income _value, $Res Function(_$_Income) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeName = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$_Income(
      incomeName: null == incomeName
          ? _value.incomeName
          : incomeName // ignore: cast_nullable_to_non_nullable
              as IncomeName,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Income extends _Income {
  _$_Income(
      {required this.incomeName, required this.amount, required this.date})
      : super._();

  @override
  final IncomeName incomeName;
  @override
  final Amount amount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Income(incomeName: $incomeName, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Income &&
            (identical(other.incomeName, incomeName) ||
                other.incomeName == incomeName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incomeName, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeCopyWith<_$_Income> get copyWith =>
      __$$_IncomeCopyWithImpl<_$_Income>(this, _$identity);
}

abstract class _Income extends Income {
  factory _Income(
      {required final IncomeName incomeName,
      required final Amount amount,
      required final DateTime date}) = _$_Income;
  _Income._() : super._();

  @override
  IncomeName get incomeName;
  @override
  Amount get amount;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeCopyWith<_$_Income> get copyWith =>
      throw _privateConstructorUsedError;
}
