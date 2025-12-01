// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_difficulty.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AiDifficulty _$AiDifficultyFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'easy':
          return _Easy.fromJson(
            json
          );
                case 'hard':
          return _Hard.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AiDifficulty',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AiDifficulty {



  /// Serializes this AiDifficulty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiDifficulty);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiDifficulty()';
}


}

/// @nodoc
class $AiDifficultyCopyWith<$Res>  {
$AiDifficultyCopyWith(AiDifficulty _, $Res Function(AiDifficulty) __);
}


/// Adds pattern-matching-related methods to [AiDifficulty].
extension AiDifficultyPatterns on AiDifficulty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Easy value)?  easy,TResult Function( _Hard value)?  hard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Easy() when easy != null:
return easy(_that);case _Hard() when hard != null:
return hard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Easy value)  easy,required TResult Function( _Hard value)  hard,}){
final _that = this;
switch (_that) {
case _Easy():
return easy(_that);case _Hard():
return hard(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Easy value)?  easy,TResult? Function( _Hard value)?  hard,}){
final _that = this;
switch (_that) {
case _Easy() when easy != null:
return easy(_that);case _Hard() when hard != null:
return hard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  easy,TResult Function()?  hard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Easy() when easy != null:
return easy();case _Hard() when hard != null:
return hard();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  easy,required TResult Function()  hard,}) {final _that = this;
switch (_that) {
case _Easy():
return easy();case _Hard():
return hard();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  easy,TResult? Function()?  hard,}) {final _that = this;
switch (_that) {
case _Easy() when easy != null:
return easy();case _Hard() when hard != null:
return hard();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Easy extends AiDifficulty {
  const _Easy({final  String? $type}): $type = $type ?? 'easy',super._();
  factory _Easy.fromJson(Map<String, dynamic> json) => _$EasyFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$EasyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Easy);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiDifficulty.easy()';
}


}




/// @nodoc
@JsonSerializable()

class _Hard extends AiDifficulty {
  const _Hard({final  String? $type}): $type = $type ?? 'hard',super._();
  factory _Hard.fromJson(Map<String, dynamic> json) => _$HardFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$HardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hard);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiDifficulty.hard()';
}


}




// dart format on
