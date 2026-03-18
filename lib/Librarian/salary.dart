import 'package:flutter/material.dart';

class SalaryBankDetailsPage extends StatelessWidget {
  const SalaryBankDetailsPage({super.key});

  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.account_balance_wallet, color: Colors.white, size: 28),
        title: const Text(
          "Salary & Bank Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// BANK DETAILS CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.account_balance, color: Colors.white70, size: 22),
                      SizedBox(width: 10),
                      Text(
                        "Bank Details",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white10, height: 24),
                  buildDetailRow("Account Holder:", "Ananya R. Singh"),
                  buildDetailRow("Account Number:", "214569003487"),
                  buildDetailRow("Bank Name:", "State Bank of India"),
                  buildDetailRow("IFSC Code:", "SBIN0001234"),
                  buildDetailRow("Branch:", "Tonk Road, Jaipur"),
                  buildDetailRow("Current Salary:", "₹68,000.00"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// PAST SALARY RECORDS CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.history, color: Colors.white70, size: 22),
                      SizedBox(width: 10),
                      Text(
                        "Past Salary Records",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white10, height: 24),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.priority_high, color: cardColor, size: 30),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "No Salary Records Found",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "There are no past salary records to display for\nyour account.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
