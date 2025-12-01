// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Game {

 Board get board; Player get currentPlayer; GameStatus get status; GameMode get mode; List<Position> get winningLine; int get moveCount;
/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameCopyWith<Game> get copyWith => _$GameCopyWithImpl<Game>(this as Game, _$identity);

  /// Serializes this Game to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Game&&(identical(other.board, board) || other.board == board)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.status, status) || other.status == status)&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other.winningLine, winningLine)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,board,currentPlayer,status,mode,const DeepCollectionEquality().hash(winningLine),moveCount);

@override
String toString() {
  return 'Game(board: $board, currentPlayer: $currentPlayer, status: $status, mode: $mode, winningLine: $winningLine, moveCount: $moveCount)';
}


}

/// @nodoc
abstract mixin class $GameCopyWith<$Res>  {
  factory $GameCopyWith(Game value, $Res Function(Game) _then) = _$GameCopyWithImpl;
@useResult
$Res call({
 Board board, Player currentPlayer, GameStatus status, GameMode mode, List<Position> winningLine, int moveCount
});


$BoardCopyWith<$Res> get board;$GameStatusCopyWith<$Res> get status;$GameModeCopyWith<$Res> get mode;

}
/// @nodoc
class _$GameCopyWithImpl<$Res>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._self, this._then);

  final Game _self;
  final $Res Function(Game) _then;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? board = null,Object? currentPlayer = null,Object? status = null,Object? mode = null,Object? winningLine = null,Object? moveCount = null,}) {
  return _then(_self.copyWith(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as Player,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as GameMode,winningLine: null == winningLine ? _self.winningLine : winningLine // ignore: cast_nullable_to_non_nullable
as List<Position>,moveCount: null == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameStatusCopyWith<$Res> get status {
  
  return $GameStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameModeCopyWith<$Res> get mode {
  
  return $GameModeCopyWith<$Res>(_self.mode, (value) {
    return _then(_self.copyWith(mode: value));
  });
}
}


/// Adds pattern-matching-related methods to [Game].
extension GamePatterns on Game {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Game value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Game value)  $default,){
final _that = this;
switch (_that) {
case _Game():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Game value)?  $default,){
final _that = this;
switch (_that) {
case _Game() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Board board,  Player currentPlayer,  GameStatus status,  GameMode mode,  List<Position> winningLine,  int moveCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.board,_that.currentPlayer,_that.status,_that.mode,_that.winningLine,_that.moveCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Board board,  Player currentPlayer,  GameStatus status,  GameMode mode,  List<Position> winningLine,  int moveCount)  $default,) {final _that = this;
switch (_that) {
case _Game():
return $default(_that.board,_that.currentPlayer,_that.status,_that.mode,_that.winningLine,_that.moveCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Board board,  Player currentPlayer,  GameStatus status,  GameMode mode,  List<Position> winningLine,  int moveCount)?  $default,) {final _that = this;
switch (_that) {
case _Game() when $default != null:
return $default(_that.board,_that.currentPlayer,_that.status,_that.mode,_that.winningLine,_that.moveCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Game extends Game {
  const _Game({required this.board, required this.currentPlayer, required this.status, required this.mode, final  List<Position> winningLine = const [], this.moveCount = 0}): _winningLine = winningLine,super._();
  factory _Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

@override final  Board board;
@override final  Player currentPlayer;
@override final  GameStatus status;
@override final  GameMode mode;
 final  List<Position> _winningLine;
@override@JsonKey() List<Position> get winningLine {
  if (_winningLine is EqualUnmodifiableListView) return _winningLine;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_winningLine);
}

@override@JsonKey() final  int moveCount;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameCopyWith<_Game> get copyWith => __$GameCopyWithImpl<_Game>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Game&&(identical(other.board, board) || other.board == board)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.status, status) || other.status == status)&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other._winningLine, _winningLine)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,board,currentPlayer,status,mode,const DeepCollectionEquality().hash(_winningLine),moveCount);

@override
String toString() {
  return 'Game(board: $board, currentPlayer: $currentPlayer, status: $status, mode: $mode, winningLine: $winningLine, moveCount: $moveCount)';
}


}

/// @nodoc
abstract mixin class _$GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$GameCopyWith(_Game value, $Res Function(_Game) _then) = __$GameCopyWithImpl;
@override @useResult
$Res call({
 Board board, Player currentPlayer, GameStatus status, GameMode mode, List<Position> winningLine, int moveCount
});


@override $BoardCopyWith<$Res> get board;@override $GameStatusCopyWith<$Res> get status;@override $GameModeCopyWith<$Res> get mode;

}
/// @nodoc
class __$GameCopyWithImpl<$Res>
    implements _$GameCopyWith<$Res> {
  __$GameCopyWithImpl(this._self, this._then);

  final _Game _self;
  final $Res Function(_Game) _then;

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? board = null,Object? currentPlayer = null,Object? status = null,Object? mode = null,Object? winningLine = null,Object? moveCount = null,}) {
  return _then(_Game(
board: null == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as Board,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as Player,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GameStatus,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as GameMode,winningLine: null == winningLine ? _self._winningLine : winningLine // ignore: cast_nullable_to_non_nullable
as List<Position>,moveCount: null == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoardCopyWith<$Res> get board {
  
  return $BoardCopyWith<$Res>(_self.board, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameStatusCopyWith<$Res> get status {
  
  return $GameStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of Game
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameModeCopyWith<$Res> get mode {
  
  return $GameModeCopyWith<$Res>(_self.mode, (value) {
    return _then(_self.copyWith(mode: value));
  });
}
}

// dart format on
