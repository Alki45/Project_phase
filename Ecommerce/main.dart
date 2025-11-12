import 'dart:io';
import 'product.dart';
import 'productManagement.dart';

void main() {
  ProductManager manager = ProductManager();

  print(" Welcome to the E-commerce Product Management System ");
  print("What Do you want to do?");

    while (true) {
        print("1: Adding Product");
        print("2: View Products");
        print("3: delete Product");
        print("4: Edit Product");
        print("5: View Product Details");
        print("6: Exit");
        stdout.write("Enter your choice: ");
        String? input = stdin.readLineSync();
        if (input == null) {
            print("Invalid input. Please try again.");
            continue;
    }

    switch (input) {
        case '1':
            print("Enter product details:");

                stdout.write("Name: ");
                String name = stdin.readLineSync()!;

                stdout.write("Description: ");
                String description = stdin.readLineSync()!;

                stdout.write("Price: ");
                double price = double.parse(stdin.readLineSync()!);

                stdout.write("Image URL: ");
                String image = stdin.readLineSync()!;

                stdout.write("Status (true/false): ");
                bool status = stdin.readLineSync()!.toLowerCase() == 'true';

                // Create a new product 
                Product newProduct = Product(
                    name: name,
                    description: description,
                    price: price,
                    image: image,
                    status: status,
                );

                // Add product to manager
                manager.addProduct(newProduct);

                print("\n Product added successfully!");
            break;
        case '2':
            print("\n Product List:");
            manager.viewProducts();
            break;
        case '3':
            stdout.write("Enter Product ID to delete: ");
            int idToDelete = int.parse(stdin.readLineSync()!);
            manager.deleteProduct(idToDelete);
            break;
        case '4':
        stdout.write("Enter Product ID to edit: ");
        int idToEdit = int.parse(stdin.readLineSync()!);

        // Get the existing product
        Product? existingProduct = manager.getProductById(idToEdit);

        if (existingProduct == null) {
            print(" Product with ID $idToEdit not found.");
            break;
        }

        print("\nLeave a field blank to keep its current value.\n");

        // Name
        stdout.write("Enter new name [${existingProduct.name}]: ");
        String? newName = stdin.readLineSync();
        if (newName == null || newName.isEmpty) newName = existingProduct.name;

        // Description
        stdout.write("Enter new description [${existingProduct.description}]: ");
        String? newDescription = stdin.readLineSync();
        if (newDescription == null || newDescription.isEmpty) newDescription = existingProduct.description;

        // Price
        stdout.write("Enter new price [${existingProduct.price}]: ");
        String? priceInput = stdin.readLineSync();
        double newPrice;
        if (priceInput == null || priceInput.isEmpty) {
            newPrice = existingProduct.price;
        } else {
            try {
            newPrice = double.parse(priceInput);
            } catch (e) {
            print("⚠️ Invalid price. Keeping previous value.");
            newPrice = existingProduct.price;
            }
        }

        // Image URL
        stdout.write("Enter new image URL [${existingProduct.image}]: ");
        String? newImage = stdin.readLineSync();
        if (newImage == null || newImage.isEmpty) newImage = existingProduct.image;

        // Status
        stdout.write("Enter new status (true/false) [${existingProduct.status}]: ");
        String? statusInput = stdin.readLineSync();
        bool newStatus;
        if (statusInput == null || statusInput.isEmpty) {
            newStatus = existingProduct.status;
        } else {
            newStatus = statusInput.toLowerCase() == 'true';
        }

        // Apply changes
        manager.editProduct(
            idToEdit,
            name: newName,
            description: newDescription,
            price: newPrice,
            image: newImage,
            status: newStatus,
        );

        print("\n✅ Product updated successfully!");
        break;
        case '5':
            stdout.write("Enter Product ID to view details: ");
            int idToView = int.parse(stdin.readLineSync()!);
            manager.ViewProductDetails(idToView);
            break;
        case '6':
            print("Exiting the system. Goodbye!");
            return;
        default:
            print("Invalid choice. Please try again.");
    }
    }

}
