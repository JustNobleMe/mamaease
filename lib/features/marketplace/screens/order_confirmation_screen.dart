import 'package:flutter/material.dart';
import 'package:myapp/data/dummy/products_data.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final Product product = args['product'];
    final int quantity = args['quantity'];
    final double total = args['total'];

    final String orderId = "ORD-${DateTime.now().millisecondsSinceEpoch}";

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),

      appBar: AppBar(title: const Text("Order Confirmed")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            /// SUCCESS ICON
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Order Successful!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Your order has been placed successfully.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            /// ORDER DETAILS
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    _row("Order ID", orderId),

                    const Divider(),

                    _row("Product", product.name),

                    _row("Quantity", quantity.toString()),

                    const Divider(),

                    _row("Amount Paid", "₦${total.toStringAsFixed(0)}"),

                    _row("Status", "Confirmed", valueColor: Colors.green),

                    _row("Delivery", "2 - 5 Business Days"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// PRODUCT SUMMARY
            Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.asset(
                    product.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(product.name),
                subtitle: Text("Qty: $quantity"),
              ),
            ),

            const SizedBox(height: 30),

            // /// TRACK ORDER
            // SizedBox(
            //   width: double.infinity,
            //   height: 55,

            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: AppColors.primary,
            //     ),

            //     onPressed: () {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text("Order tracking coming soon")),
            //       );
            //     },

            //     child: const Text(
            //       "Track Order",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 12),

            /// CONTINUE SHOPPING
            SizedBox(
              width: double.infinity,
              height: 55,

              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/marketplace',
                    (route) => false,
                  );
                },

                child: const Text("Continue Shopping"),
              ),
            ),

            const SizedBox(height: 12),

            /// BACK HOME
            SizedBox(
              width: double.infinity,
              height: 55,

              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },

                child: const Text("Back To Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value, {Color valueColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),

          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.bold, color: valueColor),
            ),
          ),
        ],
      ),
    );
  }
}
