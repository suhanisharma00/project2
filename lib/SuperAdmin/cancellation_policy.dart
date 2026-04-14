import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancellationPolicyScreen extends StatelessWidget {
  const CancellationPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B3354),
        title: const Text("Cancellation Policy", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cancellation & Refund Policy",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "At Eduphin ERP, we strive to provide the best service possible. If you are not satisfied with our platform, please review our cancellation policy.",
                style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
              ),
              SizedBox(height: 20),
              Text("1. Subscription Cancellation", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                "You may cancel your subscription at any time. However, cancellations made after the billing cycle has started will not be eligible for a refund for that period.",
                style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
              ),
              SizedBox(height: 20),
              Text("2. Refund Eligibility", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                "Refunds are processed on a case-by-case basis. If there is a technical failure on our end that prevents you from using the service, you may be eligible for a pro-rated refund.",
                style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
              ),
            ],


          ),
        ),
      ),
    );
  }
}

