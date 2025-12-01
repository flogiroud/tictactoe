// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GameMode _$GameModeFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'local':
          return _Local.fromJson(
            json
          );
                case 'ai':
          return _Ai.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GameMode',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GameMode {



  /// Serializes this GameMode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameMode);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameMode()';
}


}

/// @nodoc
class $GameModeCopyWith<$Res>  {
$GameModeCopyWith(GameMode _, $Res Function(GameMode) __);
}


/// Adds pattern-matching-related methods to [GameMode].
extension GameModePatterns on GameMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Local value)?  local,TResult Function( _Ai value)?  ai,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Local() when local != null:
return local(_that);case _Ai() when ai != null:
return ai(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Local value)  local,required TResult Function( _Ai value)  ai,}){
final _that = this;
switch (_that) {
case _Local():
return local(_that);case _Ai():
return ai(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Local value)?  local,TResult? Function( _Ai value)?  ai,}){
final _that = this;
switch (_that) {
case _Local() when local != null:
return local(_that);case _Ai() when ai != null:
return ai(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  local,TResult Function( AiDifficulty difficulty)?  ai,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Local() when local != null:
return local();case _Ai() when ai != null:
return ai(_that.difficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  local,required TResult Function( AiDifficulty difficulty)  ai,}) {final _that = this;
switch (_that) {
case _Local():
return local();case _Ai():
return ai(_that.difficulty);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  local,TResult? Function( AiDifficulty difficulty)?  ai,}) {final _that = this;
switch (_that) {
case _Local() when local != null:
return local();case _Ai() when ai != null:
return ai(_that.difficulty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Local extends GameMode {
  const _Local({final  String? $type}): $type = $type ?? 'local',super._();
  factory _Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LocalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Local);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameMode.local()';
}


}




/// @nodoc
@JsonSerializable()

class _Ai extends GameMode {
  const _Ai({this.difficulty = const AiDifficulty.hard(), final  String? $type}): $type = $type ?? 'ai',super._();
  factory _Ai.fromJson(Map<String, dynamic> json) => _$AiFromJson(json);

@JsonKey() final  AiDifficulty difficulty;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiCopyWith<_Ai> get copyWith => __$AiCopyWithImpl<_Ai>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ai&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,difficulty);

@override
String toString() {
  return 'GameMode.ai(difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class _$AiCopyWith<$Res> implements $GameModeCopyWith<$Res> {
  factory _$AiCopyWith(_Ai value, $Res Function(_Ai) _then) = __$AiCopyWithImpl;
@useResult
$Res call({
 AiDifficulty difficulty
});


$AiDifficultyCopyWith<$Res> get difficulty;

}
/// @nodoc
class __$AiCopyWithImpl<$Res>
    implements _$AiCopyWith<$Res> {
  __$AiCopyWithImpl(this._self, this._then);

  final _Ai _self;
  final $Res Function(_Ai) _then;

/// Create a copy of GameMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? difficulty = null,}) {
  return _then(_Ai(
difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as AiDifficulty,
  ));
}

/// Create a copy of GameMode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiDifficultyCopyWith<$Res> get difficulty {
  
  return $AiDifficultyCopyWith<$Res>(_self.difficulty, (value) {
    return _then(_self.copyWith(difficulty: value));
  });
}
}

// dart format on
