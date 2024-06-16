class Item {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  String selectedSize;
  int selectedQuantity;

  // Constructor
  Item({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    this.selectedSize = '',
    this.selectedQuantity = 0,
  });

  //convert item object to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'description': description,
      'selectedSize': selectedSize,
      'selectedQuantity': selectedQuantity,
    };
  }

  //to convert item from json back to item object
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      price: json['price'],
      imagePath: json['imagePath'],
      description: json['description'],
      selectedSize: json['selectedSize'] ?? '',
      selectedQuantity: json['selectedQuantity'] ?? 0,
    );
  }
}
