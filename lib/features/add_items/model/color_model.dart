import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_model.freezed.dart';

@freezed
class ColorModelF with _$ColorModelF {
  const factory ColorModelF({
     int? colorId,
    @Default(0) int? number,
    @Default(0) int quantity,
    @Default(0) int roll,
  }) = _ColorModelF;
}

