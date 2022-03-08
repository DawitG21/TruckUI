import 'dart:convert';

class Permission {
  String? id;
  String permissionName;

  Permission({this.id, required this.permissionName});

  factory Permission.fromJson(Map<String, dynamic> jsonData) {
    return Permission(
      id: jsonData['id'],
      permissionName: jsonData['permissionName'],
    );
  }

  static Map<String, dynamic> toMap(Permission permission) => {
        'id': permission.id,
        'permissionName': permission.permissionName,
      };
  static String encode(List<Permission> permission) => json.encode(
        permission
            .map<Map<String, dynamic>>(
                (permission) => Permission.toMap(permission))
            .toList(),
      );

  static List<Permission> decode(String permissions) =>
      (json.decode(permissions) as List<dynamic>)
          .map<Permission>((item) => Permission.fromJson(item))
          .toList();
}
