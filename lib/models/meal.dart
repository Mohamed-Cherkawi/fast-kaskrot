class Meal {
  final int id;
  final String imageName;
  final String title;
  final String availability;
  final String description;
  final double price;
  final int restaurantId;

  Meal({required this.id,
      required this.imageName,
      required this.title,
      required this.availability,
      required this.description,
      required this.price,
      required this.restaurantId});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'image_name': imageName,
      'title': title,
      'availability': availability,
      'description' : description,
      'price' : price ,
      'restaurant_id' : restaurantId
    };
  }

  @override
  String toString() {
    return 'Meal{id: $id, imageName: $imageName, title: $title, availability: $availability, description: $description, price: $price, restaurantId: $restaurantId}';
  }
}