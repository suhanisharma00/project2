import 'package:flutter/material.dart';

class ScansPage extends StatefulWidget {
  const ScansPage({super.key});

  @override
  State<ScansPage> createState() => _ScansPageState();
}

class _ScansPageState extends State<ScansPage> {
  bool isDarkMode = true;

  // Dark Theme Colors
  static const Color darkPrimaryBg = Color(0xFF070B1D);
  static const Color darkCardBg = Color(0xFF11172D);
  static const Color darkTextColor = Colors.white;

  // Light Theme Colors
  static const Color lightPrimaryBg = Color(0xFFF0F2F5);
  static const Color lightCardBg = Colors.white;
  static const Color lightTextColor = Color(0xFF0D1127);

  static const Color accentBlue = Color(0xFF2196F3);
  static const Color criticalRed = Color(0xFFF44336);
  static const Color severityHigh = Color(0xFFFB8C00);
  static const Color successGreen = Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    Color primaryBg = isDarkMode ? darkPrimaryBg : lightPrimaryBg;
    Color cardBg = isDarkMode ? darkCardBg : lightCardBg;
    Color textColor = isDarkMode ? darkTextColor : lightTextColor;
    Color subTextColor = isDarkMode ? Colors.white54 : Colors.black54;

    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        title: Row(
          children: [
            Text("NexusEDR / ", style: TextStyle(color: subTextColor, fontSize: 14)),
            Text("Scans", style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(
              icon: Icon(isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round, color: textColor, size: 20),
              onPressed: () => setState(() => isDarkMode = !isDarkMode),
              tooltip: "Change Theme",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(textColor, subTextColor),
            const SizedBox(height: 24),
            _buildScanCards(cardBg, textColor, subTextColor),
            const SizedBox(height: 24),
            _buildInProgressScan(cardBg, textColor, subTextColor),
            const SizedBox(height: 24),
            _buildScanHistory(cardBg, textColor, subTextColor),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(Color textColor, Color subTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Malware Scanning", style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: accentBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(4), border: Border.all(color: accentBlue.withOpacity(0.5))),
              child: const Text("AD-HOC SCAN", style: TextStyle(color: accentBlue, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text("NDS SIGNATURE MATCHING • HEURISTIC PATTERN ANALYSIS • ON-DEMAND & SCHEDULED", style: TextStyle(color: subTextColor, fontSize: 10, letterSpacing: 0.5)),
      ],
    );
  }

  Widget _buildScanCards(Color cardBg, Color textColor, Color subTextColor) {
    return Column(
      children: [
        _buildScanCard(
          icon: Icons.bolt,
          iconColor: Colors.amber,
          title: "Quick Scan",
          subtitle: "/tmp - /home - /usr/local/bin",
          estimatedTime: "~2-5 min",
          cardBg: cardBg,
          textColor: textColor,
          subTextColor: subTextColor,
          onTap: () {},
        ),
        const SizedBox(height: 16),
        _buildScanCard(
          icon: Icons.search,
          iconColor: accentBlue,
          title: "Full System Scan",
          subtitle: "Entire filesystem",
          estimatedTime: "20-60 min",
          cardBg: cardBg,
          textColor: textColor,
          subTextColor: subTextColor,
          onTap: () {},
        ),
        const SizedBox(height: 16),
        _buildScanCard(
          icon: Icons.track_changes,
          iconColor: criticalRed,
          title: "Custom Path Scan",
          subtitle: "Choose specific directory",
          estimatedTime: "10-20 min",
          cardBg: cardBg,
          textColor: textColor,
          subTextColor: subTextColor,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildScanCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String estimatedTime,
    required Color cardBg,
    required Color textColor,
    required Color subTextColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isDarkMode ? Colors.white10 : Colors.black12),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 48),
            const SizedBox(height: 16),
            Text(title, style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: subTextColor, fontSize: 12)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: Colors.amber.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.amber.withOpacity(0.3))),
              child: Text(estimatedTime, style: const TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInProgressScan(Color cardBg, Color textColor, Color subTextColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentBlue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.sync, color: accentBlue, size: 18),
                  const SizedBox(width: 8),
                  Text("Quick Scan — In Progress", style: TextStyle(color: textColor, fontSize: 13, fontWeight: FontWeight.bold)),
                ],
              ),
              const Text("45%", style: TextStyle(color: accentBlue, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: 0.45, backgroundColor: Colors.white10, color: accentBlue, minHeight: 4),
          const SizedBox(height: 8),
          Text("Currently scanning: /home/user/cache/thumbnails - 24,891 files scanned - 0 threats", style: TextStyle(color: subTextColor, fontSize: 10)),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: criticalRed, padding: const EdgeInsets.symmetric(horizontal: 16)),
              child: const Text("Cancel", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanHistory(Color cardBg, Color textColor, Color subTextColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: isDarkMode ? Colors.white10 : Colors.black12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.history, color: textColor, size: 20),
              const SizedBox(width: 8),
              Text("Scan History", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 24,
              headingRowHeight: 40,
              dataRowHeight: 50,
              columns: [
                _buildTableColumn("Type", subTextColor),
                _buildTableColumn("Status", subTextColor),
                _buildTableColumn("Path / Scope", subTextColor),
                _buildTableColumn("Files Scanned", subTextColor),
                _buildTableColumn("Threats", subTextColor),
                _buildTableColumn("Started", subTextColor),
                _buildTableColumn("Duration", subTextColor),
                _buildTableColumn("By", subTextColor),
                _buildTableColumn("Actions", subTextColor),
              ],
              rows: [
                _buildHistoryRow("QUICK", "RUNNING", "/tmp, /home, /usr/local", "24,891", "0", "14:30:00", "In progress", "admin", "PAUSE", accentBlue),
                _buildHistoryRow("FULL", "COMPLETE", "/ (entire system)", "1,248,392", "3", "09 Mar 02:00", "47m 22s", "scheduler", "REPORT", criticalRed),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Showing 1-2 of 1,234 scans", style: TextStyle(color: subTextColor, fontSize: 10)),
              Row(
                children: List.generate(4, (index) => Container(
                  margin: const EdgeInsets.only(left: 4),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: cardBg, border: Border.all(color: subTextColor.withOpacity(0.2)), borderRadius: BorderRadius.circular(4)),
                  child: Icon(Icons.chevron_left, size: 14, color: subTextColor),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DataColumn _buildTableColumn(String label, Color color) {
    return DataColumn(label: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)));
  }

  DataRow _buildHistoryRow(String type, String status, String path, String files, String threats, String started, String duration, String by, String action, Color actionColor) {
    return DataRow(
      cells: [
        DataCell(Text(type, style: const TextStyle(color: Colors.white38, fontSize: 11))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: accentBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(4), border: Border.all(color: accentBlue.withOpacity(0.3))),
            child: Text(status, style: const TextStyle(color: accentBlue, fontSize: 9, fontWeight: FontWeight.bold)),
          ),
        ),
        DataCell(Text(path, style: const TextStyle(color: accentBlue, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(Text(files, style: const TextStyle(color: Colors.purpleAccent, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(Text(threats, style: TextStyle(color: threats == "0" ? successGreen : criticalRed, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(Text(started, style: const TextStyle(color: Colors.white38, fontSize: 11))),
        DataCell(Text(duration, style: const TextStyle(color: Colors.white38, fontSize: 11))),
        DataCell(Text(by, style: const TextStyle(color: accentBlue, fontSize: 11))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: actionColor, borderRadius: BorderRadius.circular(4)),
            child: Text(action, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
