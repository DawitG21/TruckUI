import 'dart:convert';

class GeneralSettings {
  String id;
  String settingName;
  String value;
  String description;

  GeneralSettings({
    required this.id,
    required this.settingName,
    required this.value,
    required this.description,
  });

  factory GeneralSettings.fromJson(Map<String, dynamic> jsonData) {
    return GeneralSettings(
      id: jsonData['id'],
      settingName: jsonData['settingName'],
      value: jsonData['value'],
      description: jsonData['description'],
    );
  }

  static Map<String, dynamic> toMap(GeneralSettings settings) => {
        'id': settings.id,
        'settingName': settings.settingName,
        'value': settings.value,
        'description': settings.description,
      };

  static String encode(List<GeneralSettings> setting) => json.encode(
        setting
            .map<Map<String, dynamic>>(
                (setting) => GeneralSettings.toMap(setting))
            .toList(),
      );

  static List<GeneralSettings> decode(String setting) =>
      (json.decode(setting) as List<dynamic>)
          .map<GeneralSettings>((item) => GeneralSettings.fromJson(item))
          .toList();
}
