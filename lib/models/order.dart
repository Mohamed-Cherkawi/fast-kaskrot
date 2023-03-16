class Order {
  final int id;
  final String orderedAt;
  final double totalPrice;
  final int orderedBy;

  Order({required this.id, required this.orderedAt,required this.totalPrice ,required this.orderedBy});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'ordered_at': orderedAt,
      'total_price' : totalPrice,
      'ordered_by': orderedBy
    };
  }

  @override
  String toString() {
    return 'Order{id: $id, orderedAt: $orderedAt, totalPrice: $totalPrice, orderedBy: $orderedBy}';
  }
}