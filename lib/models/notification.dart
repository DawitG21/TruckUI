// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable(explicitToJson: true)
class Notifications {
  String? id;
  bool? type;
  String? subject;
  String? message;
  var createdAt;

  Notifications({
    this.id,
    this.type = false,
    this.subject,
    this.message,
    this.createdAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
