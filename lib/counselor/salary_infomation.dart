import 'package:flutter/material.dart';

class SalaryBankPage extends StatelessWidget {
  const SalaryBankPage({super.key});

  static const Color bgColor = Color(0xff070f2b);
  static const Color cardColor = Color(0xff3b4366);
  static const Color borderColor = Color(0xff9aa0b4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.account_balance_wallet, size: 28),
            SizedBox(width: 10),
            Text(
              "Salary & Bank Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            /// BANK DETAILS CARD
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [

                  /// HEADER
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: borderColor),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.account_balance, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Bank Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// CONTENT
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [

                        infoRow("Account Holder:", "Ananya R. Singh"),

                        const SizedBox(height: 16),

                        infoRow("", "214569003487"),

                        const SizedBox(height: 16),

                        infoRow("Bank Name:", "State Bank of India"),

                        const SizedBox(height: 16),

                        infoRow("IFSC Code:", "SBIN0001234"),

                        const SizedBox(height: 16),

                        infoRow("Branch:", "Tonk Road, Jaipur"),

                        const SizedBox(height: 16),

                        infoRow("Current Salary:", "₹68,000.00"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            /// PAST SALARY RECORDS
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [

                  /// HEADER
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: borderColor),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.history, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Past Salary Records",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// EMPTY STATE
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Column(
                      children: [

                        const CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.error_outline,
                              color: Colors.black, size: 32),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "No Salary Records Found",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "There are no past salary records to display for your account.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ROW WIDGET
  Widget infoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          width: 160,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
