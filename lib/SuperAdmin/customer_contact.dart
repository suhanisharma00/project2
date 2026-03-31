import 'package:flutter/material.dart';

class CustomerContactScreen extends StatelessWidget {
  const CustomerContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Customer Contact Messages", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildIncomingMessages(),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomingMessages() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.assignment_ind, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text("Incoming Messages", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const Text("Review messages sent by customers through the contact form.", style: TextStyle(color: Colors.white60, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text("Show Entries", style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white70, size: 16),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: const Text("search", style: TextStyle(color: Colors.white38, fontSize: 13)),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildIconBtn(Icons.copy, Colors.blue),
              const SizedBox(width: 8),
              _buildIconBtn(Icons.description, Colors.teal),
              const SizedBox(width: 8),
              _buildIconBtn(Icons.print, Colors.green),
              const SizedBox(width: 8),
              _buildIconBtn(Icons.picture_as_pdf, Colors.red),
            ],
          ),
          const SizedBox(height: 16),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildIconBtn(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(3),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white24))),
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("Email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("Phone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
          ],
        ),
        _buildTableRow("1", "Test'", "test@gmail.com", "09875878587"),
        _buildTableRow("2", "Test'", "test@gmail.com", "09875878587"),
      ],
    );
  }

  TableRow _buildTableRow(String id, String name, String email, String phone) {
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white12))),
      children: [
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(id, style: const TextStyle(color: Colors.white70, fontSize: 11))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 11))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(email, style: const TextStyle(color: Colors.white, fontSize: 11))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(phone, style: const TextStyle(color: Colors.white, fontSize: 11))),
      ],
    );
  }
}
