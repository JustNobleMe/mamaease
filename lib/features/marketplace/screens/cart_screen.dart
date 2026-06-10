import 'package:flutter/material.dart';
import 'package:myapp/app_colors.dart';
import 'package:myapp/data/dummy/products_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Product product;
  late int quantity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    product = args['product'];
    quantity = args['quantity'];
  }

  @override
  Widget build(BuildContext context) {
    final double subtotal = product.price * quantity;

    const double deliveryFee = 2000;

    final double total = subtotal + deliveryFee;

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(title: const Text("Shopping Cart")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),

                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      child: Image.asset(
                        product.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            "₦${product.price.toStringAsFixed(0)}",
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle),
                        ),

                        Text(quantity.toString()),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    _priceRow("Subtotal", "#${subtotal.toStringAsFixed(0)}"),

                    const SizedBox(height: 10),

                    _priceRow(
                      "Delivery Fee",
                      "#${deliveryFee.toStringAsFixed(0)}",
                    ),

                    const Divider(),

                    _priceRow(
                      "Total",
                      "#${total.toStringAsFixed(0)}",
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),

                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/order-confirmation',
                    arguments: {
                      'product': product,
                      'quantity': quantity,
                      'total': product.price * quantity,
                    },
                  );
                },

                child: const Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),

        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
