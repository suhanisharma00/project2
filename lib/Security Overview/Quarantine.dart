import 'package:flutter/material.dart';

class QuarantinePage extends StatelessWidget {
  const QuarantinePage({super.key});

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
        title: Row(
          children: const [
            Text("NexusEDR / ", style: TextStyle(color: Colors.white54, fontSize: 14)),
            Text("Quarantine", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.wb_sunny_outlined, color: Colors.white70, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildInfoBox(),
            const SizedBox(height: 24),
            _buildQuarantineVaultTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Quarantine Vault", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text("ISOLATED THREATS • FORENSIC PRESERVATION • SECURE STORAGE", 
          style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 0.5)),
      ],
    );
  }

  Widget _buildInfoBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accentBlue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accentBlue.withOpacity(0.3)),
      ),
      child: const Text(
        "Quarantined files are isolated and cannot execute. They are preserved for forensic analysis.",
        style: TextStyle(color: accentBlue, fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildQuarantineVaultTable() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 24,
              headingRowHeight: 45,
              dataRowHeight: 60,
              horizontalMargin: 0,
              columns: const [
                DataColumn(label: Text("FILE NAME", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Original Path", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Threat", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Severity", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Size", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Quarantined", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Host", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Actions", style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold))),
              ],
              rows: [
                _buildQuarantineRow(
                  "shell.php.nexusq",
                  "/var/www/html/wp-content/uploads/shell.php",
                  "WebShell_PHP_Generic",
                  "CRITICAL",
                  criticalRed,
                  "4.2 KB",
                  "09 Mar 14:28",
                  "SRV-WEB-02",
                ),
                _buildQuarantineRow(
                  "xmrig.nexusq",
                  "/tmp/.cache/svc/xmrig",
                  "Miner.XMRig.Generic",
                  "HIGH",
                  severityHigh,
                  "2.1 MB",
                  "09 Mar 14:11",
                  "SRV-DB-01",
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text("Showing 1-2 of 2 quarantined files", style: TextStyle(color: Colors.white24, fontSize: 10)),
        ],
      ),
    );
  }

  DataRow _buildQuarantineRow(
    String fileName,
    String path,
    String threat,
    String severity,
    Color severityColor,
    String size,
    String date,
    String host,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(fileName, style: const TextStyle(color: accentBlue, fontSize: 11, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))),
        DataCell(Text(path, style: const TextStyle(color: Colors.white38, fontSize: 10))),
        DataCell(Text(threat, style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: severityColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: severityColor.withOpacity(0.5)),
            ),
            child: Text(severity, style: TextStyle(color: severityColor, fontSize: 8, fontWeight: FontWeight.bold)),
          ),
        ),
        DataCell(Text(size, style: const TextStyle(color: accentBlue, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(Text(date, style: const TextStyle(color: Colors.white38, fontSize: 11))),
        DataCell(Text(host, style: const TextStyle(color: accentBlue, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(
          Row(
            children: [
              _buildSmallActionButton("Analyze", const Color(0xFF2B3354)),
              const SizedBox(width: 6),
              _buildSmallActionButton("Delete", criticalRed),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallActionButton(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(color == criticalRed ? 0.2 : 1.0),
        borderRadius: BorderRadius.circular(4),
        border: color == criticalRed ? Border.all(color: criticalRed.withOpacity(0.5)) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color == criticalRed ? criticalRed : Colors.white70,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
