// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'general_type.g.dart';

@JsonSerializable(explicitToJson: true)
class GeneralType {
  String? id;
  String? name;

  GeneralType({this.id, this.name});
  factory GeneralType.fromJson(Map<String, dynamic> json) =>
      _$GeneralTypeFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralTypeToJson(this);

  @override
  @override
  String toString() {
    String output = '{id: $id, name:$name}';
    return output;
  }
}
