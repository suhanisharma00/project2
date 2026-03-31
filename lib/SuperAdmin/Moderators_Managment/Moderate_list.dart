import 'package:flutter/material.dart';

class ModeratorListScreen extends StatelessWidget {
  const ModeratorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("👥 Moderators Management", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person_add, size: 16),
              label: const Text("ADD NEW MODERATOR", style: TextStyle(fontSize: 10)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B3354),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFilterSection(),
            const SizedBox(height: 20),
            _buildModeratorDirectory(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.filter_alt, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text("Filter Moderators", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          _buildDropdownFilter("Filter by Status"),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF454D66)),
              child: const Text("RESET FILTERS", style: TextStyle(color: Colors.white70)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownFilter(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: const Text("Select an option", style: TextStyle(color: Colors.white38, fontSize: 13)),
                dropdownColor: const Color(0xFF2B3354),
                items: [],
                onChanged: (v) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeratorDirectory() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.list, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text("Moderator Directory", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const Text("View and manage all registered moderators.", style: TextStyle(color: Colors.white60, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            children: [
              const Spacer(),
              const Text("show entries", style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(4)),
                child: const Text("10", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: const Text("Search Remarks", style: TextStyle(color: Colors.white38, fontSize: 13)),
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
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(3),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white24))),
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("PHOTO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("NAME", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ],
        ),
        _buildTableRow("1", "Priya S. Verma"),
      ],
    );
  }

  TableRow _buildTableRow(String id, String name) {
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white12))),
      children: [
        Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Text(id, style: const TextStyle(color: Colors.white70))),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: const Text("IMG", style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
