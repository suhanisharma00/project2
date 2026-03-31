import 'package:flutter/material.dart';

class InstituteDetailsScreen extends StatelessWidget {
  const InstituteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B3354),
        title: const Text(
          "Institute Details: Indian Institute of Applied Sciences (IIAS)",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade400,
                child: const Center(child: Text("Logo", style: TextStyle(fontWeight: FontWeight.bold))),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Column(
                children: [
                  Text("Indian Institute of Applied Sciences (IIAS)",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  Text("IIAS-MOCK-001", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildDetailRow("Established Year:", "2025"),
            _buildDetailRow("Address:", "lot No. 88, Knowledge Park, Mock Industrial Estate, Delhi, New Delhi - 102030"),
            _buildDetailRow("Contact Email:", "contact@iias.com", isLink: true),
            _buildDetailRow("Contact Phone:", "9876543210", isLink: true),
            _buildDetailRow("Chairman Name:", "Dr. Aarav N."),
            _buildDetailRow("Website:", "https://iias-example.edu", isLink: true),
            _buildDetailRow("Affiliation Details:", "Board of Technical Education — AFF (FICT); Affiliation no.: AFF-FIC-2025"),
            _buildStatusRow("Status:", "Active"),
            const SizedBox(height: 40),
            _buildButton(Icons.manage_accounts, "MANAGE ACCOUNT", const Color(0xFF454D66)),
            const SizedBox(height: 16),
            _buildButton(Icons.edit, "EDIT INSTITUTE", const Color(0xFFE6A23C)),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                decoration: isLink ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String status) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(color: Colors.green.shade800, borderRadius: BorderRadius.circular(4)),
            child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String label, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18, color: Colors.white),
        label: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
