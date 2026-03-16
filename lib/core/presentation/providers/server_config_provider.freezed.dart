// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_config_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkDiagnosis {

 bool get isWifiConnected; String? get currentSsid; bool get isApiReachable; String? get suggestion;
/// Create a copy of NetworkDiagnosis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkDiagnosisCopyWith<NetworkDiagnosis> get copyWith => _$NetworkDiagnosisCopyWithImpl<NetworkDiagnosis>(this as NetworkDiagnosis, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkDiagnosis&&(identical(other.isWifiConnected, isWifiConnected) || other.isWifiConnected == isWifiConnected)&&(identical(other.currentSsid, currentSsid) || other.currentSsid == currentSsid)&&(identical(other.isApiReachable, isApiReachable) || other.isApiReachable == isApiReachable)&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion));
}


@override
int get hashCode => Object.hash(runtimeType,isWifiConnected,currentSsid,isApiReachable,suggestion);

@override
String toString() {
  return 'NetworkDiagnosis(isWifiConnected: $isWifiConnected, currentSsid: $currentSsid, isApiReachable: $isApiReachable, suggestion: $suggestion)';
}


}

/// @nodoc
abstract mixin class $NetworkDiagnosisCopyWith<$Res>  {
  factory $NetworkDiagnosisCopyWith(NetworkDiagnosis value, $Res Function(NetworkDiagnosis) _then) = _$NetworkDiagnosisCopyWithImpl;
@useResult
$Res call({
 bool isWifiConnected, String? currentSsid, bool isApiReachable, String? suggestion
});




}
/// @nodoc
class _$NetworkDiagnosisCopyWithImpl<$Res>
    implements $NetworkDiagnosisCopyWith<$Res> {
  _$NetworkDiagnosisCopyWithImpl(this._self, this._then);

  final NetworkDiagnosis _self;
  final $Res Function(NetworkDiagnosis) _then;

/// Create a copy of NetworkDiagnosis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isWifiConnected = null,Object? currentSsid = freezed,Object? isApiReachable = null,Object? suggestion = freezed,}) {
  return _then(_self.copyWith(
isWifiConnected: null == isWifiConnected ? _self.isWifiConnected : isWifiConnected // ignore: cast_nullable_to_non_nullable
as bool,currentSsid: freezed == currentSsid ? _self.currentSsid : currentSsid // ignore: cast_nullable_to_non_nullable
as String?,isApiReachable: null == isApiReachable ? _self.isApiReachable : isApiReachable // ignore: cast_nullable_to_non_nullable
as bool,suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NetworkDiagnosis].
extension NetworkDiagnosisPatterns on NetworkDiagnosis {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NetworkDiagnosis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkDiagnosis() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NetworkDiagnosis value)  $default,){
final _that = this;
switch (_that) {
case _NetworkDiagnosis():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NetworkDiagnosis value)?  $default,){
final _that = this;
switch (_that) {
case _NetworkDiagnosis() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isWifiConnected,  String? currentSsid,  bool isApiReachable,  String? suggestion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkDiagnosis() when $default != null:
return $default(_that.isWifiConnected,_that.currentSsid,_that.isApiReachable,_that.suggestion);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isWifiConnected,  String? currentSsid,  bool isApiReachable,  String? suggestion)  $default,) {final _that = this;
switch (_that) {
case _NetworkDiagnosis():
return $default(_that.isWifiConnected,_that.currentSsid,_that.isApiReachable,_that.suggestion);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isWifiConnected,  String? currentSsid,  bool isApiReachable,  String? suggestion)?  $default,) {final _that = this;
switch (_that) {
case _NetworkDiagnosis() when $default != null:
return $default(_that.isWifiConnected,_that.currentSsid,_that.isApiReachable,_that.suggestion);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkDiagnosis implements NetworkDiagnosis {
  const _NetworkDiagnosis({required this.isWifiConnected, this.currentSsid, required this.isApiReachable, this.suggestion});
  

@override final  bool isWifiConnected;
@override final  String? currentSsid;
@override final  bool isApiReachable;
@override final  String? suggestion;

/// Create a copy of NetworkDiagnosis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NetworkDiagnosisCopyWith<_NetworkDiagnosis> get copyWith => __$NetworkDiagnosisCopyWithImpl<_NetworkDiagnosis>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkDiagnosis&&(identical(other.isWifiConnected, isWifiConnected) || other.isWifiConnected == isWifiConnected)&&(identical(other.currentSsid, currentSsid) || other.currentSsid == currentSsid)&&(identical(other.isApiReachable, isApiReachable) || other.isApiReachable == isApiReachable)&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion));
}


@override
int get hashCode => Object.hash(runtimeType,isWifiConnected,currentSsid,isApiReachable,suggestion);

@override
String toString() {
  return 'NetworkDiagnosis(isWifiConnected: $isWifiConnected, currentSsid: $currentSsid, isApiReachable: $isApiReachable, suggestion: $suggestion)';
}


}

/// @nodoc
abstract mixin class _$NetworkDiagnosisCopyWith<$Res> implements $NetworkDiagnosisCopyWith<$Res> {
  factory _$NetworkDiagnosisCopyWith(_NetworkDiagnosis value, $Res Function(_NetworkDiagnosis) _then) = __$NetworkDiagnosisCopyWithImpl;
@override @useResult
$Res call({
 bool isWifiConnected, String? currentSsid, bool isApiReachable, String? suggestion
});




}
/// @nodoc
class __$NetworkDiagnosisCopyWithImpl<$Res>
    implements _$NetworkDiagnosisCopyWith<$Res> {
  __$NetworkDiagnosisCopyWithImpl(this._self, this._then);

  final _NetworkDiagnosis _self;
  final $Res Function(_NetworkDiagnosis) _then;

/// Create a copy of NetworkDiagnosis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isWifiConnected = null,Object? currentSsid = freezed,Object? isApiReachable = null,Object? suggestion = freezed,}) {
  return _then(_NetworkDiagnosis(
isWifiConnected: null == isWifiConnected ? _self.isWifiConnected : isWifiConnected // ignore: cast_nullable_to_non_nullable
as bool,currentSsid: freezed == currentSsid ? _self.currentSsid : currentSsid // ignore: cast_nullable_to_non_nullable
as String?,isApiReachable: null == isApiReachable ? _self.isApiReachable : isApiReachable // ignore: cast_nullable_to_non_nullable
as bool,suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ServerConfigState {

 ServerMode get mode; String get apiBaseUrl; String get mqttHost; bool get isSyncing; String get syncMessage; NetworkDiagnosis? get lastDiagnosis;
/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerConfigStateCopyWith<ServerConfigState> get copyWith => _$ServerConfigStateCopyWithImpl<ServerConfigState>(this as ServerConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerConfigState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.apiBaseUrl, apiBaseUrl) || other.apiBaseUrl == apiBaseUrl)&&(identical(other.mqttHost, mqttHost) || other.mqttHost == mqttHost)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing)&&(identical(other.syncMessage, syncMessage) || other.syncMessage == syncMessage)&&(identical(other.lastDiagnosis, lastDiagnosis) || other.lastDiagnosis == lastDiagnosis));
}


@override
int get hashCode => Object.hash(runtimeType,mode,apiBaseUrl,mqttHost,isSyncing,syncMessage,lastDiagnosis);

@override
String toString() {
  return 'ServerConfigState(mode: $mode, apiBaseUrl: $apiBaseUrl, mqttHost: $mqttHost, isSyncing: $isSyncing, syncMessage: $syncMessage, lastDiagnosis: $lastDiagnosis)';
}


}

/// @nodoc
abstract mixin class $ServerConfigStateCopyWith<$Res>  {
  factory $ServerConfigStateCopyWith(ServerConfigState value, $Res Function(ServerConfigState) _then) = _$ServerConfigStateCopyWithImpl;
@useResult
$Res call({
 ServerMode mode, String apiBaseUrl, String mqttHost, bool isSyncing, String syncMessage, NetworkDiagnosis? lastDiagnosis
});


$NetworkDiagnosisCopyWith<$Res>? get lastDiagnosis;

}
/// @nodoc
class _$ServerConfigStateCopyWithImpl<$Res>
    implements $ServerConfigStateCopyWith<$Res> {
  _$ServerConfigStateCopyWithImpl(this._self, this._then);

  final ServerConfigState _self;
  final $Res Function(ServerConfigState) _then;

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? apiBaseUrl = null,Object? mqttHost = null,Object? isSyncing = null,Object? syncMessage = null,Object? lastDiagnosis = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ServerMode,apiBaseUrl: null == apiBaseUrl ? _self.apiBaseUrl : apiBaseUrl // ignore: cast_nullable_to_non_nullable
as String,mqttHost: null == mqttHost ? _self.mqttHost : mqttHost // ignore: cast_nullable_to_non_nullable
as String,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,syncMessage: null == syncMessage ? _self.syncMessage : syncMessage // ignore: cast_nullable_to_non_nullable
as String,lastDiagnosis: freezed == lastDiagnosis ? _self.lastDiagnosis : lastDiagnosis // ignore: cast_nullable_to_non_nullable
as NetworkDiagnosis?,
  ));
}
/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkDiagnosisCopyWith<$Res>? get lastDiagnosis {
    if (_self.lastDiagnosis == null) {
    return null;
  }

  return $NetworkDiagnosisCopyWith<$Res>(_self.lastDiagnosis!, (value) {
    return _then(_self.copyWith(lastDiagnosis: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServerConfigState].
extension ServerConfigStatePatterns on ServerConfigState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerConfigState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerConfigState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerConfigState value)  $default,){
final _that = this;
switch (_that) {
case _ServerConfigState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerConfigState value)?  $default,){
final _that = this;
switch (_that) {
case _ServerConfigState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ServerMode mode,  String apiBaseUrl,  String mqttHost,  bool isSyncing,  String syncMessage,  NetworkDiagnosis? lastDiagnosis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerConfigState() when $default != null:
return $default(_that.mode,_that.apiBaseUrl,_that.mqttHost,_that.isSyncing,_that.syncMessage,_that.lastDiagnosis);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ServerMode mode,  String apiBaseUrl,  String mqttHost,  bool isSyncing,  String syncMessage,  NetworkDiagnosis? lastDiagnosis)  $default,) {final _that = this;
switch (_that) {
case _ServerConfigState():
return $default(_that.mode,_that.apiBaseUrl,_that.mqttHost,_that.isSyncing,_that.syncMessage,_that.lastDiagnosis);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ServerMode mode,  String apiBaseUrl,  String mqttHost,  bool isSyncing,  String syncMessage,  NetworkDiagnosis? lastDiagnosis)?  $default,) {final _that = this;
switch (_that) {
case _ServerConfigState() when $default != null:
return $default(_that.mode,_that.apiBaseUrl,_that.mqttHost,_that.isSyncing,_that.syncMessage,_that.lastDiagnosis);case _:
  return null;

}
}

}

/// @nodoc


class _ServerConfigState implements ServerConfigState {
  const _ServerConfigState({required this.mode, required this.apiBaseUrl, required this.mqttHost, this.isSyncing = false, this.syncMessage = '', this.lastDiagnosis});
  

@override final  ServerMode mode;
@override final  String apiBaseUrl;
@override final  String mqttHost;
@override@JsonKey() final  bool isSyncing;
@override@JsonKey() final  String syncMessage;
@override final  NetworkDiagnosis? lastDiagnosis;

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerConfigStateCopyWith<_ServerConfigState> get copyWith => __$ServerConfigStateCopyWithImpl<_ServerConfigState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerConfigState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.apiBaseUrl, apiBaseUrl) || other.apiBaseUrl == apiBaseUrl)&&(identical(other.mqttHost, mqttHost) || other.mqttHost == mqttHost)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing)&&(identical(other.syncMessage, syncMessage) || other.syncMessage == syncMessage)&&(identical(other.lastDiagnosis, lastDiagnosis) || other.lastDiagnosis == lastDiagnosis));
}


@override
int get hashCode => Object.hash(runtimeType,mode,apiBaseUrl,mqttHost,isSyncing,syncMessage,lastDiagnosis);

@override
String toString() {
  return 'ServerConfigState(mode: $mode, apiBaseUrl: $apiBaseUrl, mqttHost: $mqttHost, isSyncing: $isSyncing, syncMessage: $syncMessage, lastDiagnosis: $lastDiagnosis)';
}


}

/// @nodoc
abstract mixin class _$ServerConfigStateCopyWith<$Res> implements $ServerConfigStateCopyWith<$Res> {
  factory _$ServerConfigStateCopyWith(_ServerConfigState value, $Res Function(_ServerConfigState) _then) = __$ServerConfigStateCopyWithImpl;
@override @useResult
$Res call({
 ServerMode mode, String apiBaseUrl, String mqttHost, bool isSyncing, String syncMessage, NetworkDiagnosis? lastDiagnosis
});


@override $NetworkDiagnosisCopyWith<$Res>? get lastDiagnosis;

}
/// @nodoc
class __$ServerConfigStateCopyWithImpl<$Res>
    implements _$ServerConfigStateCopyWith<$Res> {
  __$ServerConfigStateCopyWithImpl(this._self, this._then);

  final _ServerConfigState _self;
  final $Res Function(_ServerConfigState) _then;

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? apiBaseUrl = null,Object? mqttHost = null,Object? isSyncing = null,Object? syncMessage = null,Object? lastDiagnosis = freezed,}) {
  return _then(_ServerConfigState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ServerMode,apiBaseUrl: null == apiBaseUrl ? _self.apiBaseUrl : apiBaseUrl // ignore: cast_nullable_to_non_nullable
as String,mqttHost: null == mqttHost ? _self.mqttHost : mqttHost // ignore: cast_nullable_to_non_nullable
as String,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,syncMessage: null == syncMessage ? _self.syncMessage : syncMessage // ignore: cast_nullable_to_non_nullable
as String,lastDiagnosis: freezed == lastDiagnosis ? _self.lastDiagnosis : lastDiagnosis // ignore: cast_nullable_to_non_nullable
as NetworkDiagnosis?,
  ));
}

/// Create a copy of ServerConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NetworkDiagnosisCopyWith<$Res>? get lastDiagnosis {
    if (_self.lastDiagnosis == null) {
    return null;
  }

  return $NetworkDiagnosisCopyWith<$Res>(_self.lastDiagnosis!, (value) {
    return _then(_self.copyWith(lastDiagnosis: value));
  });
}
}

// dart format on
