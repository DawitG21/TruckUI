import 'dart:convert';

class City {
  String? id;
  String? name;
  // double? weight;
  double? radius;
  double? latitude;
  double? longtude;
  DateTime? date;

  City({
    this.id,
    this.name,
    // this.weight,
    this.radius,
    this.latitude,
    this.longtude,
    this.date,
  });

  factory City.fromJson(Map<String, dynamic> jsonData) {
    return City(
      id: jsonData['id'],
      name: jsonData['name'],
      // weight: jsonData['weight'],
      radius: jsonData['radius'],
      latitude: jsonData['latitude'],
      longtude: jsonData['longtude'],
      date: DateTime.parse(jsonData['date']),
    );
  }

  static Map<String, dynamic> toMap(City city) => {
        'id': city.id,
        'name': city.name,
        // 'weight': city.weight,
        'radius': city.radius,
        'latitude': city.latitude,
        'longtude': city.longtude,
        'date': city.date!.toIso8601String()
      };

  static String encode(List<City> cities) => json.encode(
        cities.map<Map<String, dynamic>>((city) => City.toMap(city)).toList(),
      );

  static List<City> decode(String cities) =>
      (json.decode(cities) as List<dynamic>)
          .map<City>((item) => City.fromJson(item))
          .toList();

  // @override
  // toString() {
  //   String output =
  //       '{id: ${this.id},name: ${this.name},radius:${this.radius},latitude:${this.latitude},longtude:${this.longtude},date:${this.date}}';

  //   return output;
  // }
}
