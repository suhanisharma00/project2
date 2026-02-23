import 'package:flutter/material.dart';

class MidTermExamPage extends StatefulWidget {
  const MidTermExamPage({Key? key}) : super(key: key);

  @override
  State<MidTermExamPage> createState() => _MidTermExamPageState();
}

class _MidTermExamPageState extends State<MidTermExamPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b1026),
      appBar: AppBar(
        backgroundColor: const Color(0xff1c2340),
        title: const Text("Examinations"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// ==============================
            /// 🔽 Mid Term Dropdown
            /// ==============================
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xff3e4468),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Mid term Examination 2025",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            if (isExpanded) ...[

              /// ==============================
              /// 📘 Financial Accounting
              /// ==============================
              examCard(
                className: "Financial Accounting Basics",
                subject: "Principles of Accounting",
                date: "04 Oct 2025",
              ),

              const SizedBox(height: 20),

              /// ==============================
              /// 📗 Cost Analysis
              /// ==============================
              examCard(
                className: "Cost Analysis and Management",
                subject: "Cost Accounting Methods",
                date: "14 Oct 2025",
              ),
            ]
          ],
        ),
      ),
    );
  }

  /// ==============================
  /// 📦 Exam Card Widget
  /// ==============================
  Widget examCard({
    required String className,
    required String subject,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff2e3557),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          /// Class Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.white24)),
            ),
            child: Text(
              "Class: $className | Section: A",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),

          /// Table Header
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.white24)),
            ),
            child: const Row(
              children: [
                Expanded(
                    child: Text("Subject",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                Expanded(
                    child: Text("Date",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                Expanded(
                    child: Text("Time",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ),

          /// Data Row 1
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.white24)),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(subject,
                        style: const TextStyle(color: Colors.white))),
                Expanded(
                    child: Text(date,
                        style: const TextStyle(color: Colors.white))),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text("9.00 AM - 12.00 PM",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),

          /// Venue + Action Row
          Container(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                const Expanded(
                  child: Text("Room 102",
                      style: TextStyle(color: Colors.white)),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade600),
                    onPressed: () {},
                    child: const Text("Enter Marks"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
