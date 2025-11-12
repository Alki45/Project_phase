class Product {
  int id;
  String name;
  String description;
  double price;
  String image;
  bool status;

  Product({

    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.status,
  }): id = DateTime.now().millisecondsSinceEpoch;

  void display() {
    print('######################');
    print('ID: $id');
    print('Name: $name');
    print('Description: $description');
    print('Price: \$${price.toStringAsFixed(2)}');
    print('Image: $image');
    print('Status: ${status ? "Available" : "Unavailable"}');
  }
}
