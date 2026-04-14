import 'package:flutter/material.dart';
import 'Analytics_page.dart';
import 'Yara/YARA_Rules.dart';
import 'all_alerts.dart';
import 'scans.dart';
import 'threat/Threat_Intel.dart';
import 'Signatures.dart';
import 'Settings_page.dart';
import 'Endpoints.dart';
import 'ReverseShellAttemptDetected.dart';

class SecurityDashboard extends StatelessWidget {
  const SecurityDashboard({super.key});

  static const Color primaryBg = Color(0xFF070B1D);
  static const Color cardBg = Color(0xFF11172D);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color criticalRed = Color(0xFFF44336);
  static const Color severityHigh = Color(0xFFFB8C00);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color textColor = Colors.white;

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
              const Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(width: 16),
              _buildStatusIndicator("ALL SYSTEMS OPERATIONAL", successGreen),
              const SizedBox(width: 12),
              _buildStatusIndicator("12 OPEN ALERTS", criticalRed),
              const SizedBox(width: 12),
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38, width: 1.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.bar_chart, color: Colors.white70, size: 16),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnalyticsPage())),
                tooltip: "View Analytics",
              ),
              const Icon(Icons.wb_sunny_outlined, color: Colors.white70, size: 20),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildMetricsGrid(context),
            const SizedBox(height: 24),
            _buildAlertVolumeChart(context),
            const SizedBox(height: 24),
            _buildDonutAndTechniques(),
            const SizedBox(height: 24),
            _buildRecentAlerts(context),
            const SizedBox(height: 24),
            _buildQuickActions(context),
            const SizedBox(height: 24),
            _buildEndpointHealth(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 3, backgroundColor: color),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Security Overview", style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
        const Text("MON 23 MAY 2026 | 12:45:32 IST - REAL-TIME MONITORING", style: TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ScansPage())),
              icon: const Icon(Icons.add, size: 16),
              label: const Text("New Scan"),
              style: ElevatedButton.styleFrom(backgroundColor: accentBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
            ),
            OutlinedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllAlertsPage())),
              style: OutlinedButton.styleFrom(side: const BorderSide(color: accentBlue), foregroundColor: accentBlue),
              child: const Text("View All Alerts"),
            ),
            OutlinedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnalyticsPage())),
              icon: const Icon(Icons.analytics, size: 16),
              label: const Text("Analytics"),
              style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white24), foregroundColor: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricsGrid(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount = constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 600 ? 3 : 2);
      return GridView.count(
        crossAxisCount: crossAxisCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: [
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ThreatIntelPage())),
            child: _buildMetricCard("Critical Threats", "7", "3 vs yesterday", criticalRed, true),
          ),
          _buildMetricCard("High Severity", "18", "5 vs yesterday", severityHigh, true),
          _buildMetricCard("Open Alerts", "34", "8 vs yesterday", accentBlue, true),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EndpointsPage())),
            child: _buildMetricCard("Protected Endpoints", "8", "100% vs yesterday", successGreen, false),
          ),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignaturesPage())),
            child: _buildMetricCard("Signatures", "2.4M", "Updated: 2h ago", Colors.cyan, false),
          ),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const YaraRulesPage())),
            child: _buildMetricCard("YARA Rules", "47", "All active", Colors.purpleAccent, false),
          ),
          _buildMetricCard("Files Scanned Today", "94K", "Clean: 99.8%", Colors.teal, false),
        ],
      );
    });
  }

  Widget _buildMetricCard(String title, String value, String subtitle, Color accentColor, bool isTrend) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: accentColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70, fontSize: 11), overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
          const SizedBox(height: 4),
          Row(
            children: [
              if (isTrend) Icon(Icons.arrow_upward, color: accentColor, size: 10),
              if (isTrend) const SizedBox(width: 4),
              Expanded(child: Text(subtitle, style: TextStyle(color: isTrend ? accentColor : Colors.white38, fontSize: 9), overflow: TextOverflow.ellipsis)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAlertVolumeChart(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            children: [
              const Text("📈 Alert Volume — 7 Days", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildStatusIndicator("LIVE", Colors.red),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AnalyticsPage())),
                    child: const Text("Full Report", style: TextStyle(color: Colors.white38, fontSize: 12)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Container(height: 150, color: Colors.white.withOpacity(0.05)),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem("Critical", criticalRed),
                _buildLegendItem("High", severityHigh),
                _buildLegendItem("Medium", accentBlue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(width: 8, height: 8, color: color),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildDonutAndTechniques() {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Column(
          children: [
            _buildSeverityBreakdownSection(),
            const SizedBox(height: 16),
            _buildTechniquesSection(),
          ],
        );
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: _buildSeverityBreakdownSection()),
          const SizedBox(width: 16),
          Expanded(flex: 3, child: _buildTechniquesSection()),
        ],
      );
    });
  }

  Widget _buildSeverityBreakdownSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(4)),
                child: const Icon(Icons.pie_chart, color: Colors.redAccent, size: 16),
              ),
              const SizedBox(width: 8),
              const Text("SEVERITY BREAKDOWN", style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom Donut UI
              SizedBox(
                height: 140,
                width: 140,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(width: 120, height: 120, child: CircularProgressIndicator(value: 1.0, strokeWidth: 25, color: Color(0xFF00D1FF), backgroundColor: Colors.transparent)),
                    const SizedBox(width: 120, height: 120, child: CircularProgressIndicator(value: 0.75, strokeWidth: 25, color: Color(0xFF2F81F7), backgroundColor: Colors.transparent)),
                    const SizedBox(width: 120, height: 120, child: CircularProgressIndicator(value: 0.5, strokeWidth: 25, color: Color(0xFFD29922), backgroundColor: Colors.transparent)),
                    const SizedBox(width: 120, height: 120, child: CircularProgressIndicator(value: 0.1, strokeWidth: 25, color: Color(0xFFF85149), backgroundColor: Colors.transparent)),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              // Legend
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _legendRow("Critical", const Color(0xFFF85149)),
                  const SizedBox(height: 12),
                  _legendRow("High", const Color(0xFFD29922)),
                  const SizedBox(height: 12),
                  _legendRow("Medium", const Color(0xFF2F81F7)),
                  const SizedBox(height: 12),
                  _legendRow("Low", const Color(0xFF00D1FF)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white10),
          const SizedBox(height: 10),
          const Text("Total: 94 alerts (30d)", style: TextStyle(color: Colors.white24, fontSize: 11, fontFamily: 'monospace')),
        ],
      ),
    );
  }

  Widget _legendRow(String label, Color color) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildTechniquesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("🚩 Top Attack Techniques", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildProgressItem("T1059 — Command Execution", 0.8, criticalRed),
          _buildProgressItem("T1498 — Resource Hijacking", 0.6, severityHigh),
          _buildProgressItem("T1071 — C2 Communication", 0.45, accentBlue),
          _buildProgressItem("T1068 — Privilege Escalation", 0.3, Colors.teal),
          _buildProgressItem("T1486 — Ransomware Activity", 0.15, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildProgressItem(String label, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11), overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          LinearProgressIndicator(value: value, color: color, backgroundColor: Colors.white12, minHeight: 4),
        ],
      ),
    );
  }

  Widget _buildRecentAlerts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bolt, color: Colors.amber, size: 20),
                  SizedBox(width: 8),
                  Text("Recent Alerts", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllAlertsPage())),
                style: ElevatedButton.styleFrom(backgroundColor: accentBlue, padding: const EdgeInsets.symmetric(horizontal: 16)),
                child: const Text("View All", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAlertRow(context, "CRITICAL", "Reverse Shell Attempt", "WS-PROD-01", "12:45:32", "OPEN", criticalRed),
          _buildAlertRow(context, "HIGH", "Crypto Miner: xmrig", "SRV-DB-01", "12:11:05", "MITIGATED", severityHigh),
          _buildAlertRow(context, "MEDIUM", "C2 Beaconing: Port 4444", "WS-MKTG-07", "11:47:21", "OPEN", accentBlue),
        ],
      ),
    );
  }

  Widget _buildAlertRow(BuildContext context, String severity, String threat, String host, String time, String status, Color color) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReverseShellAlertPage())),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white10))),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(4), border: Border.all(color: color)),
              child: Text(severity, style: TextStyle(color: color, fontSize: 8, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(threat, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                  Text(host, style: const TextStyle(color: Colors.white38, fontSize: 9), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Text(time, style: const TextStyle(color: Colors.white38, fontSize: 10)),
            const SizedBox(width: 8),
            Text(status, style: TextStyle(color: status == "OPEN" ? Colors.white70 : successGreen, fontSize: 9, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Quick Actions", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildActionBtn(context, "Quick Scan", const ScansPage()),
              _buildActionBtn(context, "Full Scan", const ScansPage()),
              _buildActionBtn(context, "Add YARA", const YaraRulesPage()),
              _buildActionBtn(context, "Add IOC", const ScansPage()),
              _buildActionBtn(context, "Settings", const SettingsConfigPage()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionBtn(BuildContext context, String label, Widget target) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => target)),
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.white12)),
        child: Center(child: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11))),
      ),
    );
  }

  Widget _buildEndpointHealth(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EndpointsPage())),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.monitor, color: successGreen, size: 20),
                    SizedBox(width: 8),
                    Text("Endpoint Health", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text("Add Endpoint", style: TextStyle(color: Colors.white38, fontSize: 12))),
              ],
            ),
            const SizedBox(height: 16),
            _buildHealthItem("SRV-WEB-02", "192.168.1.102", "Online"),
            const SizedBox(height: 12),
            _buildHealthItem("WS-MKTG-07", "192.168.1.155", "Online"),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthItem(String host, String ip, String status) {
    return Row(
      children: [
        const CircleAvatar(radius: 4, backgroundColor: successGreen),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(host, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              Text(ip, style: const TextStyle(color: Colors.white38, fontSize: 10)),
            ],
          ),
        ),
        Text(status, style: const TextStyle(color: successGreen, fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
