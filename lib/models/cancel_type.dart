// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'cancel_type.g.dart';

@JsonSerializable(explicitToJson: true)
class CancelType {
  String? id;
  String? name;

  CancelType({this.id, this.name});
  factory CancelType.fromJson(Map<String, dynamic> json) =>
      _$CancelTypeFromJson(json);
  Map<String, dynamic> toJson() => _$CancelTypeToJson(this);

  @override
  @override
  String toString() {
    String output = '{id: $id, name:$name}';
    return output;
  }
}
