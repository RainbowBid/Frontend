class Item {
  late String id;
  late String brief;
  late String description;
  late List<int> picture;
  late String userId;

  Item({
    required this.id,
    required this.brief,
    required this.description,
    required this.picture,
    required this.userId,
  });

  Item.withoutPicture(this.picture, {
    required this.id,
    required this.brief,
    required this.description,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brief': brief,
      'description': description,
      'picture': picture,
      'user_id': userId,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      brief: json['brief'],
      description: json['description'],
      picture: List<int>.from(json['picture']),
      userId: json['user_id'],
    );
  }
}