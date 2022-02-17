// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      id: json['id'] as String?,
      type: json['type'] as bool? ?? false,
      subject: json['subject'] as String?,
      message: json['message'] as String?,
      createdAt: json['createdAt'],
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'subject': instance.subject,
      'message': instance.message,
      'createdAt': instance.createdAt,
    };
