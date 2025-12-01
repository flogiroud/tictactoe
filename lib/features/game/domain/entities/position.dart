import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';
part 'position.g.dart';

@freezed
sealed class Position with _$Position {
  const factory Position({required int row, required int col}) = _Position;

  const Position._();

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  bool isValid(int size) => row >= 0 && row < size && col >= 0 && col < size;
}
