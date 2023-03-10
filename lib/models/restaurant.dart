class Restaurant{
  final int id;
  final String imageName;
  final String rating;
  final String name;
  final String address;

  Restaurant({ required this.id ,
    required this.imageName,
    required this.rating,
    required this.name,
    required this.address
  });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'image_name': imageName,
      'rating': rating,
      'name': name,
      'address' : address
    };
  }

  @override
  String toString() {
    return 'Restaurant{id: $id, imageName: $imageName, rating: $rating, name: $name, address: $address}';
  }
}