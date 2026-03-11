import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1230),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PROFILE CARD

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff3A4266),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [

                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Nisha Rao",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Class: Cost Analysis and Management A",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const Text(
                    "Reg. No: REG2025103",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xff5E6A77),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "CHECK REMARKS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            //  TAB

            Row(
              children: [
                tabButton("PERSONAL\nDETAILS"),
                tabButton("ADDRESS\nDETAILS"),
                tabButton("FAMILY\nDETAILS"),
                tabButton("HEALTH\nDETAILS"),
              ],
            ),

            const SizedBox(height: 20),

            // ================= STUDENT INFO =================

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff3A4266),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Student Information",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  infoText("Full Name", "Nisha Rao"),
                  infoText("Class & Section", "Cost Analysis and Management A"),
                  infoText("Registration Number", "REG2025103"),
                  infoText("Student Roll Number", "25IIAS2UG103"),
                  infoText("Aadhar Number", "XXXX"),
                  infoText("Academic Session", "2025-2026"),
                  infoText("Date of Admission", "2025-08-03"),
                  infoText("Academic Year", "2025"),
                  infoText("Admission Category", "Reserved Categories"),
                  infoText("Mentor Name", "Aman Sharma"),

                  const Divider(color: Colors.white24),

                  const SizedBox(height: 10),

                  const Text(
                    "Update Your Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  buildField("Place of Birth"),
                  buildField("Gender *"),
                  buildField("Password *"),
                  buildField("Mobile"),
                  buildField("Date of Birth"),
                  buildField("Email"),
                  buildField("Fee Frequency"),
                  buildField("Blood Group"),
                  buildField("Nationality"),
                  buildField("Religion"),
                  buildField("Caste"),
                  buildField("Domicile State"),
                  buildField("Age"),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xff5E6A77),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "UPDATE PROFILE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ================= TAB BUTTON =================

  Widget tabButton(String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xff3A4266),
          border: Border(
            right: BorderSide(color: Colors.white24),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // ================= INFO TEXT =================

  Widget infoText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            style: const TextStyle(
                color: Colors.white),
          )
        ],
      ),
    );
  }

  // ================= INPUT FIELD =================

  Widget buildField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            label,
            style: const TextStyle(
                color: Colors.white70),
          ),

          const SizedBox(height: 6),

          Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xff5E6A77),
              borderRadius: BorderRadius.circular(4),
            ),
          )
        ],
      ),
    );
  }
}
