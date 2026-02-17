import 'package:flutter/material.dart';

class SalaryBankDetailsPage extends StatelessWidget {
  const SalaryBankDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b1026),
      appBar: AppBar(
        backgroundColor: const Color(0xff1c2340),
        title: const Text("Salary & Bank Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ===============================
            /// 🔹 Bank & Salary Information
            /// ===============================
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff2e3557),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      color: Color(0xff5c6672),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.account_balance, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Bank & Salary Information",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account Holder : Devansh Mehra",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 8),
                        Text("Account Number: 560012340987",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 8),
                        Text("IFSC Code: HDFC0007890",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 16),
                        Text("Bank Name: HDFC Bank",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 8),
                        Text("Branch: Gomti Nagar, Lucknow",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 8),
                        Text("Base Salary: ₹49,000.00",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// ===============================
            /// 🔹 Past Salary Records Header
            /// ===============================
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Past Salary Records",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// ===============================
            /// 🔹 Salary Table
            /// ===============================
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff2e3557),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [

                  /// Header Row
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.white24)),
                    ),
                    child: const Row(
                      children: [
                        Expanded(child: Text("Deduction",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                        Expanded(child: Text("Net Salary",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                        Expanded(child: Text("Payment Date",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                        Expanded(child: Text("Generated By",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                        Expanded(child: Text("Action",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),

                  /// Data Row
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [

                        const Expanded(
                            child: Text("₹0.00",
                                style: TextStyle(color: Colors.white))),

                        const Expanded(
                            child: Text("₹50,000.00",
                                style: TextStyle(color: Colors.white))),

                        const Expanded(
                            child: Text("09 Oct 2025",
                                style: TextStyle(color: Colors.white))),

                        const Expanded(
                            child: Text(
                                "Rohit Kumar\n(Accountants)",
                                style: TextStyle(color: Colors.white))),

                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade600,
                            ),
                            onPressed: () {
                              // TODO: View Slip Action
                            },
                            child: const Text("VIEW SLIP"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}