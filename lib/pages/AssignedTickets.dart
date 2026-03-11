import 'package:flutter/material.dart';

import 'ticket.dart';

class AssignedTickets extends StatelessWidget {
  const AssignedTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B132B),
        elevation: 0,
        title: const Text(
          "Assigned Tickets",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔍 Search + Filters Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3553),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildTextField("Search by Title..."),
                  const SizedBox(height: 15),
                  _buildDropdown("All Priorities"),
                  const SizedBox(height: 15),
                  _buildDropdown("All Statuses"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 📋 Ticket Table
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2C3553),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _tableHeader(),
                  const Divider(color: Colors.white24),

                  /// Ticket Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text("4",
                            style: TextStyle(color: Colors.white)),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Text("Nisha Rao",
                            style: TextStyle(color: Colors.white)),
                      ),
                      const Expanded(
                        flex: 3,
                        child: Text(
                          "Issue with Fee Payment Portal",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Details Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statusChip("Low"),
                      _statusChip("Open"),
                      const Text("Payment Problem",
                          style: TextStyle(color: Colors.white)),
                      const Text("09 Oct, 2025",
                          style: TextStyle(color: Colors.white)),

                      /// VIEW / REPLY Button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF445069),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Ticket()),
                          );
                        },
                        icon: const Icon(Icons.chat_bubble_outline),
                        label: const Text("VIEW / REPLY"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF445069),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF445069),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        dropdownColor: const Color(0xFF445069),
        value: text,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        isExpanded: true,
        underline: const SizedBox(),
        items: [text]
            .map((e) =>
            DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.white))))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _tableHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("#ID", style: TextStyle(color: Colors.white)),
        Text("Issue By", style: TextStyle(color: Colors.white)),
        Text("Title", style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _statusChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF445069),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}