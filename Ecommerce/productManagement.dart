import 'product.dart';

class ProductManager {
  List<Product> products = [];
  int nextId = 1;

  // Add a product
  void addProduct(Product product) {
    product.id = nextId++;
    products.add(product);
    print("Product '${product.name}' added successfully!");
  }

  // Delete a product by ID
  void deleteProduct(int id) {
    products.removeWhere((product) => product.id == id);
    print("Product with ID $id deleted successfully.");
  }

  void ViewProductDetails(int id) {
    Product? product = getProductById(id);
    if (product != null) {
      product.display();
    } else {
      print("Product with ID $id not found.");
    }
  }

  // View all products
  void viewProducts() {
    if (products.isEmpty) {
      print("No products available.");
      return;
    }
    for (var product in products) {
      product.display();
    }
  }

  // Edit a product by ID
  void editProduct(
    int id, {
    String? name,
    String? description,
    double? price,
    String? image,
    bool? status,
  }) {
    for (var product in products) {
      if (product.id == id) {
        if (name != null) product.name = name;
        if (description != null) product.description = description;
        if (price != null) product.price = price;
        if (image != null) product.image = image;
        if (status != null) product.status = status;
        print("Product with ID $id updated successfully!");
        return;
      }
    }
    print("Product with ID $id not found.");
  }
  // Get a product by ID
  Product? getProductById(int id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
