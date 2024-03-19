class Item {
  late String id;
  late String brief;
  late String description;
  late String userId;
  late Category category;

  Item({
    required this.id,
    required this.brief,
    required this.description,
    required this.userId,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brief': brief,
      'description': description,
      'user_id': userId,
      'category': category.value,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      brief: json['brief'],
      description: json['description'],
      userId: json['user_id'],
      category: Category.fromValue(json['category']),
    );
  }
}

enum Category {
  art,
  sport,
  electronics,
  services,
  diverse,
  all;

  String get value => switch (this) {
        art => 'art',
        sport => 'sport',
        electronics => 'electronics',
        services => 'services',
        diverse => 'diverse',
        _ => '',
      };

  static Category fromValue(String value) => switch (value) {
        'art' => art,
        'sport' => sport,
        'electronics' => electronics,
        'services' => services,
        _ => diverse,
      };
}
