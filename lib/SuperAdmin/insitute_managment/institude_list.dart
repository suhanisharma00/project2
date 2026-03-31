import 'package:flutter/material.dart';

class InstituteListScreen extends StatelessWidget {
  const InstituteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1127),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("🏫 Institutes Overview", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline, size: 16),
              label: const Text("Add New Institute", style: TextStyle(fontSize: 12)),
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
            _buildInstituteDirectory(),
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
              Text("Filter Institutes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          _buildDropdownFilter("Filter by City"),
          _buildDropdownFilter("Filter by State"),
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

  Widget _buildInstituteDirectory() {
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
              Text("Institute Directory", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const Text("Manage all registered institutes within the system.", style: TextStyle(color: Colors.white60, fontSize: 12)),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildExportButton(Icons.description, const Color(0xFF4CAF50).withOpacity(0.5), "CSV"),
              const SizedBox(width: 8),
              _buildExportButton(Icons.print, const Color(0xFF388E3C), "XLS"),
              const SizedBox(width: 8),
              _buildExportButton(Icons.picture_as_pdf, const Color(0xFFD32F2F), "PDF"),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text("show entries", style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(4)),
                child: const Text("10", style: TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              const Text("Search", style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(width: 8),
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(color: const Color(0xFF2B3354), borderRadius: BorderRadius.circular(4)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _buildTable(),
          ),
        ],
      ),
    );
  }

  Widget _buildExportButton(IconData icon, Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 8)),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return DataTable(
      columnSpacing: 20,
      headingRowColor: MaterialStateProperty.all(const Color(0xFF2B3354)),
      columns: const [
        DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        DataColumn(label: Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        DataColumn(label: Text("Code", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        DataColumn(label: Text("City", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        DataColumn(label: Text("State", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        DataColumn(label: Text("Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        DataColumn(label: Text("Actions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      ],
      rows: [
        _buildDataRow("1", "Indian Institute of Applied Sciences (IIAS)", "IIAS-MOCK-001", "Delhi", "New Delhi", "Active"),
        _buildDataRow("2", "Shree Aryavart Institute of Technology", "SAITM2026", "Noida", "Uttar Pradesh", "Active"),
      ],
    );
  }

  DataRow _buildDataRow(String id, String name, String code, String city, String state, String status) {
    return DataRow(
      cells: [
        DataCell(Text(id, style: const TextStyle(color: Colors.white70))),
        DataCell(SizedBox(width: 150, child: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)))),
        DataCell(Text(code, style: const TextStyle(color: Colors.white70, fontSize: 12))),
        DataCell(Text(city, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
        DataCell(Text(state, style: const TextStyle(color: Colors.white70))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.green.shade800, borderRadius: BorderRadius.circular(4)),
            child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ),
        DataCell(
          Row(
            children: [
              _buildActionIcon(Icons.visibility, Colors.cyan.shade600),
              const SizedBox(width: 4),
              _buildActionIcon(Icons.edit, Colors.orange.shade600),
              const SizedBox(width: 4),
              _buildActionIcon(Icons.delete, Colors.red.shade600),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Icon(icon, color: Colors.white, size: 14),
    );
  }
}
