import 'package:flutter/material.dart';

class AllAlertsPage extends StatelessWidget {
  const AllAlertsPage({super.key});

  static const Color primaryBg = Color(0xFF070B1D);
  static const Color cardBg = Color(0xFF11172D);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color criticalRed = Color(0xFFF44336);
  static const Color severityHigh = Color(0xFFFB8C00);
  static const Color successGreen = Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text("NexusEDX / ", style: TextStyle(color: Colors.white54, fontSize: 14)),
              const Text("Security Alerts", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              _buildStatusIndicator("12 CRITICAL", criticalRed),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterSection(),
            const SizedBox(height: 20),
            _buildAlertEntriesSection(),
            const SizedBox(height: 20),
            const Text("Quick Summary", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildBottomHorizontalScroll(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.filter_alt, color: Colors.white70, size: 20),
              SizedBox(width: 8),
              Text("Filter Alerts", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          _buildLabel("Select Severity"),
          _buildDropdownButton("All Severities"),
          const SizedBox(height: 16),
          _buildLabel("Select Engine"),
          _buildDropdownButton("All Engines"),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel("From Date"),
                    _buildCalendarField(),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel("To Date"),
                    _buildCalendarField(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text("RESET FILTERS"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF454D66),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12)),
    );
  }

  Widget _buildDropdownButton(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, style: const TextStyle(color: Colors.white38, fontSize: 13)),
          dropdownColor: cardBg,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white38),
          items: [],
          onChanged: (v) {},
        ),
      ),
    );
  }

  Widget _buildCalendarField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("dd-mm-yyyy", style: TextStyle(color: Colors.white38, fontSize: 13)),
          Icon(Icons.calendar_today, color: Colors.white38, size: 16),
        ],
      ),
    );
  }

  Widget _buildAlertEntriesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Alert Log Entries", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const Text("Real-time detailed records of system threats.", style: TextStyle(color: Colors.white38, fontSize: 11)),
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
          _buildAlertList(),
        ],
      ),
    );
  }

  Widget _buildIconBtn(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: color.withOpacity(0.3))),
      child: Icon(icon, color: color, size: 18),
    );
  }

  Widget _buildAlertList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => const Divider(color: Colors.white10),
      itemBuilder: (context, index) {
        return _buildAlertRow(
          ["CRITICAL", "HIGH", "MEDIUM"][index],
          ["Reverse Shell", "Crypto Miner", "C2 Beacon"][index],
          "WS-PROD-01",
          "12:45:32",
          [criticalRed, severityHigh, accentBlue][index],
        );
      },
    );
  }

  Widget _buildAlertRow(String severity, String threat, String host, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(4), border: Border.all(color: color)),
            child: Text(severity, style: TextStyle(color: color, fontSize: 8, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(threat, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                Text(host, style: const TextStyle(color: Colors.white38, fontSize: 10)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white24, size: 18),
        ],
      ),
    );
  }

  Widget _buildBottomHorizontalScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildSummaryCard("Total Critical", "12", criticalRed),
          _buildSummaryCard("Avg Resolution", "1.2h", accentBlue),
          _buildSummaryCard("Most Target", "PROD-DB", severityHigh),
          _buildSummaryCard("Monitored", "98.5%", successGreen),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String label, String value, Color color) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border(bottom: BorderSide(color: color, width: 3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
