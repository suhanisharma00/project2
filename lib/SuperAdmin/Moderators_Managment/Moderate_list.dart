import 'package:flutter/material.dart';

class ModeratorListScreen extends StatelessWidget {
  const ModeratorListScreen({super.key});

  static const Color primaryBg = Color(0xFF070B1D);
  static const Color cardBg = Color(0xFF11172D);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color successGreen = Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        title: const Text("Moderator Management", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_add, color: accentBlue)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchAndExport(),
            const SizedBox(height: 20),
            _buildModeratorTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndExport() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white10)),
            child: const TextField(
              style: TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: "Search moderators...",
                hintStyle: TextStyle(color: Colors.white38),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.white38, size: 18),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        _buildExportIcon(Icons.description, Colors.teal),
        const SizedBox(width: 8),
        _buildExportIcon(Icons.picture_as_pdf, Colors.redAccent),
      ],
    );
  }

  Widget _buildExportIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: color.withOpacity(0.3))),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildModeratorTable() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildModeratorRow("1", "Priya S. Verma", "Assistant", "Live"),
          const Divider(color: Colors.white10),
          _buildModeratorRow("2", "Anjali Sharma", "Moderator", "Live"),
        ],
      ),
    );
  }

  Widget _buildModeratorRow(String id, String name, String position, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(radius: 18, backgroundColor: Colors.white12, child: Icon(Icons.person, color: Colors.white38, size: 20)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                Text(position, style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: successGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
            child: Text(status, style: const TextStyle(color: successGreen, fontSize: 9, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.edit_note, color: Colors.orangeAccent, size: 20),
        ],
      ),
    );
  }
}
