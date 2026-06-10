class Product {
  final String id;
  final String name;
  final String image;
  final String category;
  final String description;
  final double price;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
  });
}

final List<Product> products = [
  Product(
    id: '1',
    name: 'Baby Car Seat',
    image: 'assets/images/carseat.jpg',
    category: 'Travel',
    description: 'Safe and comfortable baby car seat.',
    price: 45000,
    rating: 4.8,
  ),

  Product(
    id: '2',
    name: 'Johnson Baby Set',
    image: 'assets/images/johnson.jpg',
    category: 'Care',
    description: 'Complete baby skincare set.',
    price: 12500,
    rating: 4.6,
  ),

  Product(
    id: '3',
    name: 'Baby Diapers',
    image: 'assets/images/diapers.jpg',
    category: 'Essentials',
    description: 'Soft and absorbent diapers.',
    price: 8500,
    rating: 4.7,
  ),

  Product(
    id: '4',
    name: 'Baby Feeding Spoon',
    image: 'assets/images/spoon.jpg',
    category: 'Feeding',
    description: 'Safe silicone feeding spoon.',
    price: 2500,
    rating: 4.5,
  ),
];