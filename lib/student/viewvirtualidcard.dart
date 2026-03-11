import 'package:flutter/material.dart';


class viewvirtualidcard extends StatelessWidget {
  const viewvirtualidcard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentCardPage(),
    );
  }
}

class StudentCardPage extends StatelessWidget {
  const StudentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF071233),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [

            /// TOP CARD
            Container(
              width: 430,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: const Color(0xFF3F476B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Column(
                children: [

                  const Icon(Icons.person, size: 52, color: Colors.white70),
                  const SizedBox(height: 10),

                  const Text(
                    "Indian Institute of Applied Sciences (IIAS)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),

                  const SizedBox(height: 6),
                  const Text("Est. 2025",
                      style: TextStyle(color: Colors.white70)),

                  const SizedBox(height: 4),
                  const Text("9876543210",
                      style: TextStyle(color: Colors.white70)),

                  const SizedBox(height: 4),
                  const Text(
                    "lot No. 88, Knowledge Park, Mock Industrial Estate, Delhi, New Delhi 102030",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Academic Year: 2025",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white),
                  ),

                  const SizedBox(height: 22),
                  Divider(color: Colors.white.withOpacity(0.2)),
                  const SizedBox(height: 22),

                  /// Photo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCFD3DA),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.person,
                        size: 50, color: Color(0xFF3F476B)),
                  ),

                  const SizedBox(height: 20),

                  /// Student Details (NO CLASS)
                  buildDetail("Name:", "Nisha Rao"),
                  buildDetail("Roll No:", "25IIAS2UG103"),
                  buildDetail("DOB:", "22-07-2009"),
                  buildDetail("Contact:", "-"),
                ],
              ),
            ),

            const SizedBox(height: 22),

            /// STUDENT INFO SECTION
            Container(
              width: 430,
              decoration: BoxDecoration(
                color: const Color(0xFF3F476B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      color: Color(0xFF606C77),
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: const Center(
                      child: Text(
                        "Student Information",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        sectionTitle("Address"),
                        const Text(
                          "45 Lotus Avenue\nBangalore, Karnataka - 560034\nIndia",
                          style: TextStyle(color: Colors.white70),
                        ),

                        const SizedBox(height: 18),

                        sectionTitle("Guardian Details"),
                        const Text("Guardian Name: Sanjay Rao",
                            style: TextStyle(color: Colors.white70)),
                        const Text("Guardian Mobile: 9123456789",
                            style: TextStyle(color: Colors.white70)),

                        const SizedBox(height: 18),

                        sectionTitle("Institute Information"),
                        const Text("Institute Code: IIAS-MOCK-001",
                            style: TextStyle(color: Colors.white70)),
                        const Text(
                            "Affiliation: Board of Technical Education — AFF (FICT); Affiliation no.: AFF-FIC-2025",
                            style: TextStyle(color: Colors.white70)),
                        const Text("Website: https://iias-example.edu",
                            style: TextStyle(color: Colors.white70)),
                        const Text("Email: contact@iias.com",
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C7782),
                padding:
                const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: const Text(
                "DOWNLOAD PDF",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.white)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  static Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white)),
          Divider(color: Colors.white.withOpacity(0.25))
        ],
      ),
    );
  }
}