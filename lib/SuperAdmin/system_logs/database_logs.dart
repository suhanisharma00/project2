import 'package:flutter/material.dart';

class DatabaseLogsScreen extends StatelessWidget {
  const DatabaseLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.storage, color: Colors.white),
            SizedBox(width: 8),
            Text("Database Audit Logs", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFilterSection(),
            const SizedBox(height: 20),
            _buildLogEntries(),
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
              Text("Filter Database Logs", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          _buildDropdownFilter("Filter by Institute"),
          _buildDropdownFilter("Filter by Role"),
          _buildDropdownFilter("Filter by Event"),
          _buildDateField("From Date"),
          _buildDateField("To Date"),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text("RESET", style: TextStyle(color: Colors.white70)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF454D66)),
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
                hint: const Text("All Options", style: TextStyle(color: Colors.white38, fontSize: 13)),
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

  Widget _buildDateField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(8)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("dd-mm-yyyy", style: TextStyle(color: Colors.white38, fontSize: 13)),
                Icon(Icons.calendar_today, color: Colors.white38, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogEntries() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF1C223D), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.assignment, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text("Log Entries", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const Text("Detailed records of database changes and activities.", style: TextStyle(color: Colors.white60, fontSize: 12)),
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
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white24))),
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("User", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("Institute", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
            Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text("Role", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
          ],
        ),
        _buildTableRow("1", "Umang Goyal\nID: 1", "Eduphin", "Super Admin"),
        _buildTableRow("2", "Umang Goyal\nID: 1", "Eduphin", "Super Admin"),
      ],
    );
  }

  TableRow _buildTableRow(String id, String user, String inst, String role) {
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white12))),
      children: [
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(id, style: const TextStyle(color: Colors.white70, fontSize: 11))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(user, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(inst, style: const TextStyle(color: Colors.white70, fontSize: 11))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(role, style: const TextStyle(color: Colors.white70, fontSize: 11))),
      ],
    );
  }
}
