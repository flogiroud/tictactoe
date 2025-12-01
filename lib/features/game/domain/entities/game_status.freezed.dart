// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
GameStatus _$GameStatusFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'playing':
          return _Playing.fromJson(
            json
          );
                case 'won':
          return _Won.fromJson(
            json
          );
                case 'draw':
          return _Draw.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GameStatus',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GameStatus {



  /// Serializes this GameStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStatus);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus()';
}


}

/// @nodoc
class $GameStatusCopyWith<$Res>  {
$GameStatusCopyWith(GameStatus _, $Res Function(GameStatus) __);
}


/// Adds pattern-matching-related methods to [GameStatus].
extension GameStatusPatterns on GameStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Playing value)?  playing,TResult Function( _Won value)?  won,TResult Function( _Draw value)?  draw,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Playing() when playing != null:
return playing(_that);case _Won() when won != null:
return won(_that);case _Draw() when draw != null:
return draw(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Playing value)  playing,required TResult Function( _Won value)  won,required TResult Function( _Draw value)  draw,}){
final _that = this;
switch (_that) {
case _Playing():
return playing(_that);case _Won():
return won(_that);case _Draw():
return draw(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Playing value)?  playing,TResult? Function( _Won value)?  won,TResult? Function( _Draw value)?  draw,}){
final _that = this;
switch (_that) {
case _Playing() when playing != null:
return playing(_that);case _Won() when won != null:
return won(_that);case _Draw() when draw != null:
return draw(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  playing,TResult Function( Player winner)?  won,TResult Function()?  draw,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Playing() when playing != null:
return playing();case _Won() when won != null:
return won(_that.winner);case _Draw() when draw != null:
return draw();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  playing,required TResult Function( Player winner)  won,required TResult Function()  draw,}) {final _that = this;
switch (_that) {
case _Playing():
return playing();case _Won():
return won(_that.winner);case _Draw():
return draw();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  playing,TResult? Function( Player winner)?  won,TResult? Function()?  draw,}) {final _that = this;
switch (_that) {
case _Playing() when playing != null:
return playing();case _Won() when won != null:
return won(_that.winner);case _Draw() when draw != null:
return draw();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Playing implements GameStatus {
  const _Playing({final  String? $type}): $type = $type ?? 'playing';
  factory _Playing.fromJson(Map<String, dynamic> json) => _$PlayingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$PlayingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Playing);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus.playing()';
}


}




/// @nodoc
@JsonSerializable()

class _Won implements GameStatus {
  const _Won(this.winner, {final  String? $type}): $type = $type ?? 'won';
  factory _Won.fromJson(Map<String, dynamic> json) => _$WonFromJson(json);

 final  Player winner;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GameStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WonCopyWith<_Won> get copyWith => __$WonCopyWithImpl<_Won>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Won&&(identical(other.winner, winner) || other.winner == winner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,winner);

@override
String toString() {
  return 'GameStatus.won(winner: $winner)';
}


}

/// @nodoc
abstract mixin class _$WonCopyWith<$Res> implements $GameStatusCopyWith<$Res> {
  factory _$WonCopyWith(_Won value, $Res Function(_Won) _then) = __$WonCopyWithImpl;
@useResult
$Res call({
 Player winner
});




}
/// @nodoc
class __$WonCopyWithImpl<$Res>
    implements _$WonCopyWith<$Res> {
  __$WonCopyWithImpl(this._self, this._then);

  final _Won _self;
  final $Res Function(_Won) _then;

/// Create a copy of GameStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winner = null,}) {
  return _then(_Won(
null == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _Draw implements GameStatus {
  const _Draw({final  String? $type}): $type = $type ?? 'draw';
  factory _Draw.fromJson(Map<String, dynamic> json) => _$DrawFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$DrawToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Draw);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus.draw()';
}


}




// dart format on
