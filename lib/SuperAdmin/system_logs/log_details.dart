import 'package:flutter/material.dart';

class LogDetailsScreen extends StatelessWidget {
  final String title;
  final String eventType;
  final Color eventColor;

  const LogDetailsScreen({
    super.key,
    required this.title,
    required this.eventType,
    this.eventColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B3354),
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1C223D),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            children: [
              _buildInfoRow("User:", "Neelam Kapoor (ID: 8)"),
              _buildInfoRow("Institute:", "Indian Institute of Applied Sciences (IIAS)"),
              _buildInfoRow("Role:", "Librarian"),
              _buildEventRow("Event Type:", eventType, eventColor),
              _buildInfoRow("Target Model:", "User (ID: 8)"),
              _buildInfoRow("IP Address:", "1.39.94.39"),
              _buildInfoRow("Timestamp:", "12 Mar 2026, 03:11:10 PM"),
              _buildInfoRow("URL:", "https://demo.eduphin.com/login"),
              const SizedBox(height: 20),
              _buildValueSection("Old Values:", "null"),
              _buildValueSection("New Values:", '{"logged_in":true}', isJson: true),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, size: 16),
                    label: const Text("CLOSE"),
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF454D66)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white12))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 100, child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
          Expanded(child: Text(value, style: const TextStyle(color: Colors.white70, fontSize: 13))),
        ],
      ),
    );
  }

  Widget _buildEventRow(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white12))),
      child: Row(
        children: [
          SizedBox(width: 100, child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(color: color.withOpacity(0.3), borderRadius: BorderRadius.circular(12), border: Border.all(color: color)),
            child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildValueSection(String label, String value, {bool isJson = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontFamily: isJson ? 'monospace' : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
