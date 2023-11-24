// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChartData {
  String get app => throw _privateConstructorUsedError;
  int get totalUpVotes => throw _privateConstructorUsedError;
  int get totalDownVotes => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  RatingsBand get ratingsBand => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChartDataCopyWith<ChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataCopyWith<$Res> {
  factory $ChartDataCopyWith(ChartData value, $Res Function(ChartData) then) =
      _$ChartDataCopyWithImpl<$Res, ChartData>;
  @useResult
  $Res call(
      {String app,
      int totalUpVotes,
      int totalDownVotes,
      double rating,
      RatingsBand ratingsBand});
}

/// @nodoc
class _$ChartDataCopyWithImpl<$Res, $Val extends ChartData>
    implements $ChartDataCopyWith<$Res> {
  _$ChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? app = null,
    Object? totalUpVotes = null,
    Object? totalDownVotes = null,
    Object? rating = null,
    Object? ratingsBand = null,
  }) {
    return _then(_value.copyWith(
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as String,
      totalUpVotes: null == totalUpVotes
          ? _value.totalUpVotes
          : totalUpVotes // ignore: cast_nullable_to_non_nullable
              as int,
      totalDownVotes: null == totalDownVotes
          ? _value.totalDownVotes
          : totalDownVotes // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsBand: null == ratingsBand
          ? _value.ratingsBand
          : ratingsBand // ignore: cast_nullable_to_non_nullable
              as RatingsBand,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartDataImplCopyWith<$Res>
    implements $ChartDataCopyWith<$Res> {
  factory _$$ChartDataImplCopyWith(
          _$ChartDataImpl value, $Res Function(_$ChartDataImpl) then) =
      __$$ChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String app,
      int totalUpVotes,
      int totalDownVotes,
      double rating,
      RatingsBand ratingsBand});
}

/// @nodoc
class __$$ChartDataImplCopyWithImpl<$Res>
    extends _$ChartDataCopyWithImpl<$Res, _$ChartDataImpl>
    implements _$$ChartDataImplCopyWith<$Res> {
  __$$ChartDataImplCopyWithImpl(
      _$ChartDataImpl _value, $Res Function(_$ChartDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? app = null,
    Object? totalUpVotes = null,
    Object? totalDownVotes = null,
    Object? rating = null,
    Object? ratingsBand = null,
  }) {
    return _then(_$ChartDataImpl(
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as String,
      totalUpVotes: null == totalUpVotes
          ? _value.totalUpVotes
          : totalUpVotes // ignore: cast_nullable_to_non_nullable
              as int,
      totalDownVotes: null == totalDownVotes
          ? _value.totalDownVotes
          : totalDownVotes // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsBand: null == ratingsBand
          ? _value.ratingsBand
          : ratingsBand // ignore: cast_nullable_to_non_nullable
              as RatingsBand,
    ));
  }
}

/// @nodoc

class _$ChartDataImpl implements _ChartData {
  const _$ChartDataImpl(
      {required this.app,
      required this.totalUpVotes,
      required this.totalDownVotes,
      required this.rating,
      required this.ratingsBand});

  @override
  final String app;
  @override
  final int totalUpVotes;
  @override
  final int totalDownVotes;
  @override
  final double rating;
  @override
  final RatingsBand ratingsBand;

  @override
  String toString() {
    return 'ChartData(app: $app, totalUpVotes: $totalUpVotes, totalDownVotes: $totalDownVotes, rating: $rating, ratingsBand: $ratingsBand)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataImpl &&
            (identical(other.app, app) || other.app == app) &&
            (identical(other.totalUpVotes, totalUpVotes) ||
                other.totalUpVotes == totalUpVotes) &&
            (identical(other.totalDownVotes, totalDownVotes) ||
                other.totalDownVotes == totalDownVotes) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingsBand, ratingsBand) ||
                other.ratingsBand == ratingsBand));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, app, totalUpVotes, totalDownVotes, rating, ratingsBand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataImplCopyWith<_$ChartDataImpl> get copyWith =>
      __$$ChartDataImplCopyWithImpl<_$ChartDataImpl>(this, _$identity);
}

abstract class _ChartData implements ChartData {
  const factory _ChartData(
      {required final String app,
      required final int totalUpVotes,
      required final int totalDownVotes,
      required final double rating,
      required final RatingsBand ratingsBand}) = _$ChartDataImpl;

  @override
  String get app;
  @override
  int get totalUpVotes;
  @override
  int get totalDownVotes;
  @override
  double get rating;
  @override
  RatingsBand get ratingsBand;
  @override
  @JsonKey(ignore: true)
  _$$ChartDataImplCopyWith<_$ChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
