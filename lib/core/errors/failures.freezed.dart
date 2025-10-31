// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthConnectNotInstalledFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$HealthConnectNotInstalledFailureImplCopyWith(
    _$HealthConnectNotInstalledFailureImpl value,
    $Res Function(_$HealthConnectNotInstalledFailureImpl) then,
  ) = __$$HealthConnectNotInstalledFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HealthConnectNotInstalledFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$HealthConnectNotInstalledFailureImpl>
    implements _$$HealthConnectNotInstalledFailureImplCopyWith<$Res> {
  __$$HealthConnectNotInstalledFailureImplCopyWithImpl(
    _$HealthConnectNotInstalledFailureImpl _value,
    $Res Function(_$HealthConnectNotInstalledFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$HealthConnectNotInstalledFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HealthConnectNotInstalledFailureImpl
    implements HealthConnectNotInstalledFailure {
  const _$HealthConnectNotInstalledFailureImpl({
    this.message = 'Health Connect is not installed',
  });

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.healthConnectNotInstalled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthConnectNotInstalledFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthConnectNotInstalledFailureImplCopyWith<
    _$HealthConnectNotInstalledFailureImpl
  >
  get copyWith =>
      __$$HealthConnectNotInstalledFailureImplCopyWithImpl<
        _$HealthConnectNotInstalledFailureImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return healthConnectNotInstalled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return healthConnectNotInstalled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (healthConnectNotInstalled != null) {
      return healthConnectNotInstalled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return healthConnectNotInstalled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return healthConnectNotInstalled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (healthConnectNotInstalled != null) {
      return healthConnectNotInstalled(this);
    }
    return orElse();
  }
}

abstract class HealthConnectNotInstalledFailure implements Failure {
  const factory HealthConnectNotInstalledFailure({final String message}) =
      _$HealthConnectNotInstalledFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthConnectNotInstalledFailureImplCopyWith<
    _$HealthConnectNotInstalledFailureImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HealthConnectNotSupportedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$HealthConnectNotSupportedFailureImplCopyWith(
    _$HealthConnectNotSupportedFailureImpl value,
    $Res Function(_$HealthConnectNotSupportedFailureImpl) then,
  ) = __$$HealthConnectNotSupportedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HealthConnectNotSupportedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$HealthConnectNotSupportedFailureImpl>
    implements _$$HealthConnectNotSupportedFailureImplCopyWith<$Res> {
  __$$HealthConnectNotSupportedFailureImplCopyWithImpl(
    _$HealthConnectNotSupportedFailureImpl _value,
    $Res Function(_$HealthConnectNotSupportedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$HealthConnectNotSupportedFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HealthConnectNotSupportedFailureImpl
    implements HealthConnectNotSupportedFailure {
  const _$HealthConnectNotSupportedFailureImpl({
    this.message = 'Health Connect is not supported on this device',
  });

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.healthConnectNotSupported(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthConnectNotSupportedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthConnectNotSupportedFailureImplCopyWith<
    _$HealthConnectNotSupportedFailureImpl
  >
  get copyWith =>
      __$$HealthConnectNotSupportedFailureImplCopyWithImpl<
        _$HealthConnectNotSupportedFailureImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return healthConnectNotSupported(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return healthConnectNotSupported?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (healthConnectNotSupported != null) {
      return healthConnectNotSupported(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return healthConnectNotSupported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return healthConnectNotSupported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (healthConnectNotSupported != null) {
      return healthConnectNotSupported(this);
    }
    return orElse();
  }
}

abstract class HealthConnectNotSupportedFailure implements Failure {
  const factory HealthConnectNotSupportedFailure({final String message}) =
      _$HealthConnectNotSupportedFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthConnectNotSupportedFailureImplCopyWith<
    _$HealthConnectNotSupportedFailureImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionDeniedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$PermissionDeniedFailureImplCopyWith(
    _$PermissionDeniedFailureImpl value,
    $Res Function(_$PermissionDeniedFailureImpl) then,
  ) = __$$PermissionDeniedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PermissionDeniedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PermissionDeniedFailureImpl>
    implements _$$PermissionDeniedFailureImplCopyWith<$Res> {
  __$$PermissionDeniedFailureImplCopyWithImpl(
    _$PermissionDeniedFailureImpl _value,
    $Res Function(_$PermissionDeniedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$PermissionDeniedFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PermissionDeniedFailureImpl implements PermissionDeniedFailure {
  const _$PermissionDeniedFailureImpl({
    this.message = 'Permission to access health data was denied',
  });

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.permissionDenied(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionDeniedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionDeniedFailureImplCopyWith<_$PermissionDeniedFailureImpl>
  get copyWith =>
      __$$PermissionDeniedFailureImplCopyWithImpl<
        _$PermissionDeniedFailureImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return permissionDenied(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return permissionDenied?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class PermissionDeniedFailure implements Failure {
  const factory PermissionDeniedFailure({final String message}) =
      _$PermissionDeniedFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionDeniedFailureImplCopyWith<_$PermissionDeniedFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionTimeoutFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$PermissionTimeoutFailureImplCopyWith(
    _$PermissionTimeoutFailureImpl value,
    $Res Function(_$PermissionTimeoutFailureImpl) then,
  ) = __$$PermissionTimeoutFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PermissionTimeoutFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PermissionTimeoutFailureImpl>
    implements _$$PermissionTimeoutFailureImplCopyWith<$Res> {
  __$$PermissionTimeoutFailureImplCopyWithImpl(
    _$PermissionTimeoutFailureImpl _value,
    $Res Function(_$PermissionTimeoutFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$PermissionTimeoutFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PermissionTimeoutFailureImpl implements PermissionTimeoutFailure {
  const _$PermissionTimeoutFailureImpl({
    this.message = 'Permission request timed out',
  });

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.permissionTimeout(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionTimeoutFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionTimeoutFailureImplCopyWith<_$PermissionTimeoutFailureImpl>
  get copyWith =>
      __$$PermissionTimeoutFailureImplCopyWithImpl<
        _$PermissionTimeoutFailureImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return permissionTimeout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return permissionTimeout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (permissionTimeout != null) {
      return permissionTimeout(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return permissionTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return permissionTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (permissionTimeout != null) {
      return permissionTimeout(this);
    }
    return orElse();
  }
}

abstract class PermissionTimeoutFailure implements Failure {
  const factory PermissionTimeoutFailure({final String message}) =
      _$PermissionTimeoutFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionTimeoutFailureImplCopyWith<_$PermissionTimeoutFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataAccessErrorFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$DataAccessErrorFailureImplCopyWith(
    _$DataAccessErrorFailureImpl value,
    $Res Function(_$DataAccessErrorFailureImpl) then,
  ) = __$$DataAccessErrorFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class __$$DataAccessErrorFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$DataAccessErrorFailureImpl>
    implements _$$DataAccessErrorFailureImplCopyWith<$Res> {
  __$$DataAccessErrorFailureImplCopyWithImpl(
    _$DataAccessErrorFailureImpl _value,
    $Res Function(_$DataAccessErrorFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? details = freezed}) {
    return _then(
      _$DataAccessErrorFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DataAccessErrorFailureImpl implements DataAccessErrorFailure {
  const _$DataAccessErrorFailureImpl({
    this.message = 'Failed to access health data',
    this.details,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final String? details;

  @override
  String toString() {
    return 'Failure.dataAccessError(message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataAccessErrorFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataAccessErrorFailureImplCopyWith<_$DataAccessErrorFailureImpl>
  get copyWith =>
      __$$DataAccessErrorFailureImplCopyWithImpl<_$DataAccessErrorFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return dataAccessError(message, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return dataAccessError?.call(message, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (dataAccessError != null) {
      return dataAccessError(message, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return dataAccessError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return dataAccessError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (dataAccessError != null) {
      return dataAccessError(this);
    }
    return orElse();
  }
}

abstract class DataAccessErrorFailure implements Failure {
  const factory DataAccessErrorFailure({
    final String message,
    final String? details,
  }) = _$DataAccessErrorFailureImpl;

  @override
  String get message;
  String? get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataAccessErrorFailureImplCopyWith<_$DataAccessErrorFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoDataFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NoDataFoundFailureImplCopyWith(
    _$NoDataFoundFailureImpl value,
    $Res Function(_$NoDataFoundFailureImpl) then,
  ) = __$$NoDataFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoDataFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NoDataFoundFailureImpl>
    implements _$$NoDataFoundFailureImplCopyWith<$Res> {
  __$$NoDataFoundFailureImplCopyWithImpl(
    _$NoDataFoundFailureImpl _value,
    $Res Function(_$NoDataFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NoDataFoundFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NoDataFoundFailureImpl implements NoDataFoundFailure {
  const _$NoDataFoundFailureImpl({this.message = 'No sleep data found'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.noDataFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoDataFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoDataFoundFailureImplCopyWith<_$NoDataFoundFailureImpl> get copyWith =>
      __$$NoDataFoundFailureImplCopyWithImpl<_$NoDataFoundFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return noDataFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return noDataFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (noDataFound != null) {
      return noDataFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return noDataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return noDataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (noDataFound != null) {
      return noDataFound(this);
    }
    return orElse();
  }
}

abstract class NoDataFoundFailure implements Failure {
  const factory NoDataFoundFailure({final String message}) =
      _$NoDataFoundFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoDataFoundFailureImplCopyWith<_$NoDataFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkErrorFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkErrorFailureImplCopyWith(
    _$NetworkErrorFailureImpl value,
    $Res Function(_$NetworkErrorFailureImpl) then,
  ) = __$$NetworkErrorFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class __$$NetworkErrorFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkErrorFailureImpl>
    implements _$$NetworkErrorFailureImplCopyWith<$Res> {
  __$$NetworkErrorFailureImplCopyWithImpl(
    _$NetworkErrorFailureImpl _value,
    $Res Function(_$NetworkErrorFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? details = freezed}) {
    return _then(
      _$NetworkErrorFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NetworkErrorFailureImpl implements NetworkErrorFailure {
  const _$NetworkErrorFailureImpl({
    this.message = 'Network error occurred',
    this.details,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final String? details;

  @override
  String toString() {
    return 'Failure.networkError(message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorFailureImplCopyWith<_$NetworkErrorFailureImpl> get copyWith =>
      __$$NetworkErrorFailureImplCopyWithImpl<_$NetworkErrorFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return networkError(message, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return networkError?.call(message, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkErrorFailure implements Failure {
  const factory NetworkErrorFailure({
    final String message,
    final String? details,
  }) = _$NetworkErrorFailureImpl;

  @override
  String get message;
  String? get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorFailureImplCopyWith<_$NetworkErrorFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(
    _$UnknownFailureImpl value,
    $Res Function(_$UnknownFailureImpl) then,
  ) = __$$UnknownFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
    _$UnknownFailureImpl _value,
    $Res Function(_$UnknownFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? details = freezed}) {
    return _then(
      _$UnknownFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnknownFailureImpl implements UnknownFailure {
  const _$UnknownFailureImpl({
    this.message = 'An unknown error occurred',
    this.details,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final String? details;

  @override
  String toString() {
    return 'Failure.unknown(message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return unknown(message, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return unknown?.call(message, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure implements Failure {
  const factory UnknownFailure({final String message, final String? details}) =
      _$UnknownFailureImpl;

  @override
  String get message;
  String? get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidStateFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InvalidStateFailureImplCopyWith(
    _$InvalidStateFailureImpl value,
    $Res Function(_$InvalidStateFailureImpl) then,
  ) = __$$InvalidStateFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class __$$InvalidStateFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidStateFailureImpl>
    implements _$$InvalidStateFailureImplCopyWith<$Res> {
  __$$InvalidStateFailureImplCopyWithImpl(
    _$InvalidStateFailureImpl _value,
    $Res Function(_$InvalidStateFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? details = freezed}) {
    return _then(
      _$InvalidStateFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$InvalidStateFailureImpl implements InvalidStateFailure {
  const _$InvalidStateFailureImpl({
    this.message = 'Invalid application state',
    this.details,
  });

  @override
  @JsonKey()
  final String message;
  @override
  final String? details;

  @override
  String toString() {
    return 'Failure.invalidState(message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidStateFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidStateFailureImplCopyWith<_$InvalidStateFailureImpl> get copyWith =>
      __$$InvalidStateFailureImplCopyWithImpl<_$InvalidStateFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) healthConnectNotInstalled,
    required TResult Function(String message) healthConnectNotSupported,
    required TResult Function(String message) permissionDenied,
    required TResult Function(String message) permissionTimeout,
    required TResult Function(String message, String? details) dataAccessError,
    required TResult Function(String message) noDataFound,
    required TResult Function(String message, String? details) networkError,
    required TResult Function(String message, String? details) unknown,
    required TResult Function(String message, String? details) invalidState,
  }) {
    return invalidState(message, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? healthConnectNotInstalled,
    TResult? Function(String message)? healthConnectNotSupported,
    TResult? Function(String message)? permissionDenied,
    TResult? Function(String message)? permissionTimeout,
    TResult? Function(String message, String? details)? dataAccessError,
    TResult? Function(String message)? noDataFound,
    TResult? Function(String message, String? details)? networkError,
    TResult? Function(String message, String? details)? unknown,
    TResult? Function(String message, String? details)? invalidState,
  }) {
    return invalidState?.call(message, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? healthConnectNotInstalled,
    TResult Function(String message)? healthConnectNotSupported,
    TResult Function(String message)? permissionDenied,
    TResult Function(String message)? permissionTimeout,
    TResult Function(String message, String? details)? dataAccessError,
    TResult Function(String message)? noDataFound,
    TResult Function(String message, String? details)? networkError,
    TResult Function(String message, String? details)? unknown,
    TResult Function(String message, String? details)? invalidState,
    required TResult orElse(),
  }) {
    if (invalidState != null) {
      return invalidState(message, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HealthConnectNotInstalledFailure value)
    healthConnectNotInstalled,
    required TResult Function(HealthConnectNotSupportedFailure value)
    healthConnectNotSupported,
    required TResult Function(PermissionDeniedFailure value) permissionDenied,
    required TResult Function(PermissionTimeoutFailure value) permissionTimeout,
    required TResult Function(DataAccessErrorFailure value) dataAccessError,
    required TResult Function(NoDataFoundFailure value) noDataFound,
    required TResult Function(NetworkErrorFailure value) networkError,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(InvalidStateFailure value) invalidState,
  }) {
    return invalidState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult? Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult? Function(PermissionDeniedFailure value)? permissionDenied,
    TResult? Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult? Function(DataAccessErrorFailure value)? dataAccessError,
    TResult? Function(NoDataFoundFailure value)? noDataFound,
    TResult? Function(NetworkErrorFailure value)? networkError,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(InvalidStateFailure value)? invalidState,
  }) {
    return invalidState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HealthConnectNotInstalledFailure value)?
    healthConnectNotInstalled,
    TResult Function(HealthConnectNotSupportedFailure value)?
    healthConnectNotSupported,
    TResult Function(PermissionDeniedFailure value)? permissionDenied,
    TResult Function(PermissionTimeoutFailure value)? permissionTimeout,
    TResult Function(DataAccessErrorFailure value)? dataAccessError,
    TResult Function(NoDataFoundFailure value)? noDataFound,
    TResult Function(NetworkErrorFailure value)? networkError,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(InvalidStateFailure value)? invalidState,
    required TResult orElse(),
  }) {
    if (invalidState != null) {
      return invalidState(this);
    }
    return orElse();
  }
}

abstract class InvalidStateFailure implements Failure {
  const factory InvalidStateFailure({
    final String message,
    final String? details,
  }) = _$InvalidStateFailureImpl;

  @override
  String get message;
  String? get details;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidStateFailureImplCopyWith<_$InvalidStateFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
