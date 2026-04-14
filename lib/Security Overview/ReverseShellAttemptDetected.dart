import 'package:flutter/material.dart';

class ReverseShellAlertPage extends StatelessWidget {
  const ReverseShellAlertPage({super.key});

  static const Color primaryBg = Color(0xFF070B1D);
  static const Color cardBg = Color(0xFF11172D);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color criticalRed = Color(0xFFF44336);
  static const Color textColor = Colors.white;
  static const Color subTextColor = Colors.white54;
  static const Color borderColor = Colors.white10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Alert Details / #AL-902",
          style: TextStyle(color: subTextColor, fontSize: 14),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined, color: subTextColor),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: subTextColor),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Alert Status Header
            _buildAlertHeader(),
            const SizedBox(height: 24),

            /// Threat Summary
            _buildSectionTitle("THREAT SUMMARY"),
            const SizedBox(height: 12),
            _buildSummaryCard(),
            const SizedBox(height: 24),

            /// Affected Endpoint
            _buildSectionTitle("AFFECTED ENDPOINT"),
            const SizedBox(height: 12),
            _buildEndpointCard(),
            const SizedBox(height: 24),

            /// Network Details
            _buildSectionTitle("NETWORK CONNECTION"),
            const SizedBox(height: 12),
            _buildNetworkCard(),
            const SizedBox(height: 24),

            /// Detection Logic (Monospace)
            _buildSectionTitle("DETECTION LOGIC"),
            const SizedBox(height: 12),
            _buildDetectionLogicCard(),
            const SizedBox(height: 24),

            /// Mitigation Actions
            _buildMitigationActions(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Reverse Shell Attempt Detected",
              style: TextStyle(color: textColor, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildBadge("CRITICAL", criticalRed.withOpacity(0.2), criticalRed),
                const SizedBox(width: 8),
                _buildBadge("OPEN", Colors.blue.withOpacity(0.2), Colors.blueAccent),
                const SizedBox(width: 12),
                const Text("12:45:32 IST", style: TextStyle(color: subTextColor, fontSize: 12)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4), border: Border.all(color: textCol.withOpacity(0.5))),
      child: Text(text, style: TextStyle(color: textCol, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(color: subTextColor, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor)),
      child: Column(
        children: [
          _buildInfoRow("Process Name", "/usr/bin/python3", isCode: true),
          const Divider(color: borderColor, height: 24),
          _buildInfoRow("Process ID", "7712"),
          const Divider(color: borderColor, height: 24),
          _buildInfoRow("Parent Process", "/usr/sbin/apache2"),
          const Divider(color: borderColor, height: 24),
          _buildInfoRow("User", "www-data"),
        ],
      ),
    );
  }

  Widget _buildEndpointCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor)),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.monitor, color: Colors.blueAccent, size: 24),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("SRV-WEB-02", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
                Text("192.168.1.102 • Ubuntu 22.04 LTS", style: TextStyle(color: subTextColor, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: subTextColor),
        ],
      ),
    );
  }

  Widget _buildNetworkCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor)),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LOCAL ADDRESS", style: TextStyle(color: subTextColor, fontSize: 10)),
                  SizedBox(height: 4),
                  Text("192.168.1.102:4444", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
                ],
              ),
              Icon(Icons.arrow_forward, color: Colors.redAccent, size: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("REMOTE ADDRESS", style: TextStyle(color: subTextColor, fontSize: 10)),
                  SizedBox(height: 4),
                  Text("45.33.32.156:8080", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetectionLogicCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor)),
      child: const Text(
        "rule Linux_Reverse_Shell {\n  meta:\n    description = \"Detects python reverse shell behavior\"\n  strings:\n    \$s1 = \"import socket,os,pty\"\n    \$s2 = \"s.connect((\"\n  condition:\n    uint32(0) == 0x464c457f and all of them\n}",
        style: TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontSize: 12, height: 1.5),
      ),
    );
  }

  Widget _buildMitigationActions() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: criticalRed, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: const Text("ISOLATE ENDPOINT", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: const Text("KILL PROCESS", style: TextStyle(color: textColor)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: const Text("DISMISS ALERT", style: TextStyle(color: textColor)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isCode = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: subTextColor, fontSize: 13)),
        Text(
          value,
          style: TextStyle(
            color: isCode ? Colors.orangeAccent : textColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: isCode ? 'monospace' : null,
          ),
        ),
      ],
    );
  }
}
