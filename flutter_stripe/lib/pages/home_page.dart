import 'package:flutter/material.dart';
import '../services/stripe_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    StripeService.instance.init(); // Initialize Stripe service
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Payment",
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add some padding for the UI
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top UI text
            Text(
              "Let’s make your banking process easy!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 30), // Adjust spacing

            // Seat and Price Information
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    "Your Seat: Number 52",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Total Price: Rs. 1200.00",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25), // Adjust spacing

            // Credit card image
            Image.asset(
              'assets/credit_card.png',
              height: screenHeight *
                  0.25, // Adjust image height to 25% of the screen height
              width: screenWidth *
                  0.9, // Make the width of the image responsive (90% of the screen width)
              fit: BoxFit.cover, // Ensure the image fits the space
            ),
            SizedBox(height: 70), // Increased spacing between image and button

            // Centered Proceed button
            Center(
              child: MaterialButton(
                onPressed: () {
                  StripeService.instance.makePayment();
                },
                color: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
