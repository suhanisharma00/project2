import 'package:flutter/material.dart';


class yoursupportticket extends StatelessWidget {
  const yoursupportticket({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SupportTicketsPage(),
    );
  }
}

class SupportTicketsPage extends StatelessWidget {
  const SupportTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = const Color(0xFF0B1026);
    final Color cardColor = const Color(0xFF2F3757);
    final Color fieldColor = const Color(0xFF4A5568);
    final Color badgeColor = const Color(0xFF5F6B7A);
    final Color buttonBlue = const Color(0xFF3F5BD9);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Icon(Icons.access_time, color: Colors.white70),
                  SizedBox(width: 12),
                  Text(
                    "Your Support Tickets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// FILTER CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _inputField("Search by Title...", fieldColor),
                    const SizedBox(height: 20),
                    _dropdownField("All Priorities", fieldColor),
                    const SizedBox(height: 20),
                    _dropdownField("All Statuses", fieldColor),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// TABLE SECTION (SCROLLABLE ROW)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // 👉 row slide
                  child: Container(
                    width: 900,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _tableHeader(),
                        _tableRow(
                          id: "10",
                          title: "giytug",
                          priority: "Low",
                          status: "Open",
                          category: "-",
                          assigned: "Unassigned",
                          date: "30 Oct, 2025",
                          badgeColor: badgeColor,
                        ),
                        _tableRow(
                          id: "7",
                          title: "Classroom Technology Malfunction",
                          priority: "Low",
                          status: "Open",
                          category: "Technical Issue",
                          assigned: "Rajveer K. Malhotra",
                          date: "09 Oct, 2025",
                          badgeColor: badgeColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// CREATE BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 28),
                  label: const Text(
                    "CREATE NEW TICKET",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Input Field
  static Widget _inputField(String hint, Color color) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        hint,
        style: const TextStyle(color: Colors.white70, fontSize: 16),
      ),
    );
  }

  /// Dropdown Field
  static Widget _dropdownField(String text, Color color) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  /// Table Header
  static Widget _tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _headerText("#ID"),
          _headerText("Title"),
          _headerText("Priority"),
          _headerText("Status"),
          _headerText("Category"),
          _headerText("Assigned To"),
          _headerText("Created At"),
          _headerText("Action"),
        ],
      ),
    );
  }

  static Widget _tableRow({
    required String id,
    required String title,
    required String priority,
    required String status,
    required String category,
    required String assigned,
    required String date,
    required Color badgeColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _cellText(id),
          _cellText(title),
          _badge(priority, badgeColor),
          _badge(status, badgeColor),
          _cellText(category),
          _cellText(assigned),
          _cellText(date),
          _actionButton(),
        ],
      ),
    );
  }

  static Widget _cellText(String text) {
    return SizedBox(
      width: 120,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  static Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  static Widget _actionButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5F6B7A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: () {},
      child: const Text("VIEW"),
    );
  }
}

class _headerText extends StatelessWidget {
  final String text;
  const _headerText(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}