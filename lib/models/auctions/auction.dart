class Auction {
  late String id;
  late double startingPrice;
  late DateTime endDate;
  late String itemId;

  Auction({
    required this.id,
    required this.startingPrice,
    required this.endDate,
    required this.itemId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'starting_price': startingPrice,
      'end_date': endDate.toIso8601String(),
      'item_id': itemId,
    };
  }

  factory Auction.fromJson(Map<String, dynamic> json) {
    return Auction(
      id: json['id'],
      startingPrice: double.parse(json['starting_price']),
      endDate: DateTime.fromMillisecondsSinceEpoch(
        json['end_date'] * 1000,
        isUtc: true,
      ),
      itemId: json['item_id'],
    );
  }
}
