import 'dart:convert';

class Category {
  String? id;
  String? name;
  String? description;
  var weight;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.weight,
  });

  factory Category.fromJson(Map<String, dynamic> jsonData) {
    return Category(
      id: jsonData['id'],
      name: jsonData['name'],
      description: jsonData['description'],
      weight: jsonData['weight'],
    );
  }

  static Map<String, dynamic> toMap(Category category) => {
        'id': category.id,
        'name': category.name,
        'description': category.description,
        'weight': category.weight,
      };

  static String encode(List<Category> categories) => json.encode(
        categories
            .map<Map<String, dynamic>>((category) => Category.toMap(category))
            .toList(),
      );

  static List<Category> decode(String categories) =>
      (json.decode(categories) as List<dynamic>)
          .map<Category>((item) => Category.fromJson(item))
          .toList();
}
