class Bike {
  final String name;
  final String image;
  final double price;

  Bike({required this.name, required this.image, required this.price});

  factory Bike.fromJson(Map<String, dynamic> json) {
    return Bike(
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
}
