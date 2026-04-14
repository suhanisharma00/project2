import 'package:flutter/material.dart';
import 'Financial_dashboard.dart';
import 'insitute_managment/institude_list.dart';
import 'Moderators_Managment/Moderate_list.dart';
import 'system_logs/audit_logs.dart';

class SuperAdminDashboard extends StatelessWidget {
  const SuperAdminDashboard({super.key});

  static const Color primaryBg = Color(0xFF070B1D);
  static const Color cardBg = Color(0xFF11172D);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color criticalRed = Color(0xFFF44336);

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBg,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        title: Row(
          children: [
            const Text("Eduphin / ", style: TextStyle(color: Colors.white54, fontSize: 14)),
            const Text("Super Admin", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            const Spacer(),
            _buildStatusIndicator("ALL SYSTEMS LIVE", successGreen),
            const SizedBox(width: 12),
            const Icon(Icons.notifications_none, color: Colors.white70, size: 20),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildMetricsGrid(),
            const SizedBox(height: 24),
            _buildSectionTitle("Main Modules"),
            _buildModuleGrid(context),
            const SizedBox(height: 24),
            _buildSectionTitle("System Health"),
            _buildSystemHealthCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4), border: Border.all(color: color.withOpacity(0.3))),
      child: Row(
        children: [
          CircleAvatar(radius: 3, backgroundColor: color),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Platform Overview", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        const Text("Real-time management and system monitoring dashboard.", style: TextStyle(color: Colors.white54, fontSize: 12)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildMetricsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 2,
      children: [
        _buildMetricCard("Total Institutes", "12", Icons.business, accentBlue),
        _buildMetricCard("Active Users", "1.2K", Icons.people, successGreen),
        _buildMetricCard("System Logs", "450", Icons.history, Colors.orange),
        _buildMetricCard("Revenue (MTD)", "₹4.5L", Icons.payments, Colors.purple),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border(left: BorderSide(color: color, width: 4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildModuleGrid(BuildContext context) {
    final List<Map<String, dynamic>> modules = [
      {"title": "Institute Mgmt", "icon": Icons.apartment, "color": Colors.teal, "screen": const InstituteListScreen()},
      {"title": "Moderator Mgmt", "icon": Icons.security, "color": Colors.indigo, "screen": const ModeratorListScreen()},
      {"title": "Financial Overview", "icon": Icons.account_balance, "color": Colors.amber, "screen": const FinancialDashboard()},
      {"title": "Audit Logs", "icon": Icons.analytics, "color": Colors.redAccent, "screen": const AuditLogsScreen()},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.3),
      itemCount: modules.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => _navigateTo(context, modules[index]['screen']),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundColor: modules[index]['color'].withOpacity(0.1), child: Icon(modules[index]['icon'], color: modules[index]['color'])),
                const SizedBox(height: 12),
                Text(modules[index]['title'], style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSystemHealthCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: successGreen.withOpacity(0.05), borderRadius: BorderRadius.circular(12), border: Border.all(color: successGreen.withOpacity(0.2))),
      child: Column(
        children: [
          _buildHealthRow("Database Connection", "Stable", successGreen),
          const Divider(color: Colors.white10),
          _buildHealthRow("API Response Time", "120ms", Colors.blue),
          const Divider(color: Colors.white10),
          _buildHealthRow("Storage Usage", "45%", Colors.orange),
        ],
      ),
    );
  }

  Widget _buildHealthRow(String label, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          Text(status, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
