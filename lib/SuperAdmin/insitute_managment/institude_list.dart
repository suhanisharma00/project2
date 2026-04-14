import 'package:flutter/material.dart';

class InstituteListScreen extends StatelessWidget {
  const InstituteListScreen({super.key});

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
        title: const Text("Institute Directory", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_business, color: accentBlue)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFilterCard(),
            const SizedBox(height: 20),
            _buildInstituteTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Filter Institutes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildDropdown("City")),
              const SizedBox(width: 12),
              Expanded(child: _buildDropdown("State")),
            ],
          ),
          const SizedBox(height: 12),
          _buildDropdown("Status"),
        ],
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, style: const TextStyle(color: Colors.white38, fontSize: 13)),
          dropdownColor: cardBg,
          items: [],
          onChanged: (v) {},
        ),
      ),
    );
  }

  Widget _buildInstituteTable() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          _buildInstituteRow("1", "Indian Institute of Applied Sciences", "IIAS-001", "Active"),
          const Divider(color: Colors.white10),
          _buildInstituteRow("2", "Shree Aryavart Institute", "SAITM-2026", "Active"),
        ],
      ),
    );
  }

  Widget _buildInstituteRow(String id, String name, String code, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(id, style: const TextStyle(color: Colors.white38, fontSize: 12)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                Text(code, style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: successGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
            child: Text(status, style: const TextStyle(color: successGreen, fontSize: 9, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.more_vert, color: Colors.white24, size: 18),
        ],
      ),
    );
  }
}
