class Meal {
  final int id = 0;
  final String imageName;
  final String title;
  final String availability;
  final String description;
  final double price;

  Meal(
      {required this.imageName,
      required this.title,
      required this.availability,
      required this.description,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'image_name': imageName,
      'title': title,
      'availability': availability,
      'description' : description,
      'price' : price
    };
  }

  @override
  String toString() {
    return 'Meal{id: $id, imageName: $imageName, title: $title, availability: $availability, description: $description, price: $price}';
  }
}