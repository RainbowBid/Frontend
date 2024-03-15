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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brief': brief,
      'description': description,
      'picture': picture,
      'user_id': userId,
    };
  }
}