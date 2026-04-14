import 'package:flutter/material.dart';

class SettingsConfigPage extends StatefulWidget {
  const SettingsConfigPage({super.key});

  @override
  State<SettingsConfigPage> createState() => _SettingsConfigPageState();
}

class _SettingsConfigPageState extends State<SettingsConfigPage> {
  static const Color bgColor = Color(0xFF070B1D);
  static const Color cardBg = Color(0xFF11172D);
  static const Color accentBlue = Color(0xFF2196F3);
  static const Color textColor = Colors.white;
  static const Color subTextColor = Colors.white54;
  static const Color borderColor = Colors.white12;
  static const Color inputBg = Color(0xFF1B2236);

  int activeTab = 0; // 0: General, 1: Users, 2: Integrations, 3: Audit Log, 4: API Keys

  // General Settings State
  String scanSchedule = "Every 6 hours";
  bool autoQuarantine = true;
  bool autoTerminate = false;
  bool memoryScanning = true;

  // Integrations State
  String forwardSeverity = "Critical Only";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "NexusEDR / Settings",
          style: TextStyle(color: subTextColor, fontSize: 14),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.brightness_4_outlined, color: subTextColor),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings & Configuration",
                      style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "SYSTEM CONFIGURATION · USER MANAGEMENT ·\nINTEGRATIONS · AUDIT LOG",
                      style: TextStyle(color: subTextColor, fontSize: 10, letterSpacing: 0.5),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  child: const Text("SAVE CHANGES", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabItem("General", 0),
                  _buildTabItem("Users", 1),
                  _buildTabItem("Integrations", 2),
                  _buildTabItem("Audit Log", 3),
                  _buildTabItem("API Keys", 4),
                ],
              ),
            ),
            const Divider(color: borderColor, height: 1),
            const SizedBox(height: 24),

            /// Dynamic Content based on activeTab
            _buildTabContent(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    bool isActive = activeTab == index;
    return GestureDetector(
      onTap: () => setState(() => activeTab = index),
      child: Container(
        margin: const EdgeInsets.only(right: 24),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: isActive ? const Border(bottom: BorderSide(color: accentBlue, width: 2)) : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (activeTab) {
      case 0:
        return _buildGeneralTab();
      case 1:
        return _buildUsersTab();
      case 2:
        return _buildIntegrationsTab();
      case 3:
        return _buildAuditLogTab();
      case 4:
        return _buildApiKeysTab();
      default:
        return Center(
          child: Text(
            "Content for this tab is coming soon...",
            style: TextStyle(color: subTextColor),
          ),
        );
    }
  }

  /// TABS CONTENT
  Widget _buildGeneralTab() {
    return Column(
      children: [
        _buildSection(
          icon: Icons.settings_outlined,
          title: "General Settings",
          children: [
            _buildInputLabel("Alert Retention (Days)"),
            _buildTextField("90"),
            const SizedBox(height: 20),
            _buildInputLabel("Scan Schedule"),
            _buildDropdown(
              value: scanSchedule,
              items: ["Every 1 hour", "Every 6 hours", "Every 12 hours", "Daily"],
              onChanged: (val) => setState(() => scanSchedule = val!),
            ),
            const SizedBox(height: 20),
            _buildCheckboxTile(
              title: "Auto-Quarantine Critical Threats",
              subtitle: "Automatically quarantine files matching critical signatures",
              value: autoQuarantine,
              onChanged: (val) => setState(() => autoQuarantine = val!),
            ),
            _buildCheckboxTile(
              title: "Auto-Terminate Critical Processes",
              subtitle: "Automatically kill processes matching behavioral rules",
              value: autoTerminate,
              onChanged: (val) => setState(() => autoTerminate = val!),
            ),
            const SizedBox(height: 20),
            _buildInputLabel("Email Alerts"),
            _buildTextField("Security@company.com"),
          ],
        ),
        const SizedBox(height: 24),
        _buildSection(
          icon: Icons.computer_outlined,
          title: "Agent Configuration",
          children: [
            _buildInputLabel("Process Monitor Interval (seconds)"),
            _buildTextField("5"),
            const SizedBox(height: 20),
            _buildInputLabel("File Monitor Interval (seconds)"),
            _buildTextField("10"),
            const SizedBox(height: 20),
            _buildInputLabel("Network Monitor Interval (seconds)"),
            _buildTextField("8"),
            const SizedBox(height: 20),
            _buildCheckboxTile(
              title: "Enable Memory Scanning",
              subtitle: "Scan process memory (high CPU impact)",
              value: memoryScanning,
              onChanged: (val) => setState(() => memoryScanning = val!),
            ),
            const SizedBox(height: 20),
            _buildInputLabel("Agent Secret Key"),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: inputBg,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: borderColor),
                    ),
                    child: const Text("········", style: TextStyle(color: textColor, fontSize: 16)),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: borderColor),
                    backgroundColor: inputBg,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  ),
                  child: const Text("Regenerate", style: TextStyle(color: textColor, fontSize: 11)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUsersTab() {
    return _buildSection(
      icon: Icons.description_outlined,
      title: "User Accounts",
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 800, // Fixed width for horizontal scroll
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1.5),
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(1.5),
                4: FlexColumnWidth(1),
                5: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: borderColor))),
                  children: [
                    _buildTableHeader("Username"),
                    _buildTableHeader("Role"),
                    _buildTableHeader("Created"),
                    _buildTableHeader("Last Login"),
                    _buildTableHeader("Status"),
                    _buildTableHeader("Actions"),
                  ],
                ),
                _buildUserRow("admin", "ADMINISTRATOR", "09 Mar 2026", "14:32 today", true),
                _buildUserRow("analyst-01", "ANALYST", "01 Mar 2026", "09:14 today", true, showDelete: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIntegrationsTab() {
    return Column(
      children: [
        _buildSection(
          title: "SIEM Integration",
          children: [
            _buildInputLabel("SIEM URL"),
            _buildTextField("https://siem.company.com/api/event"),
            const SizedBox(height: 20),
            _buildInputLabel("API Token"),
            _buildTextField("Bearer token..."),
            const SizedBox(height: 20),
            _buildInputLabel("Forward Severity"),
            _buildDropdown(
              value: forwardSeverity,
              items: ["Critical Only", "High & Critical", "All Alerts"],
              onChanged: (val) => setState(() => forwardSeverity = val!),
            ),
            const SizedBox(height: 20),
            _buildSmallButton("Test Connection", Icons.cast_connected),
          ],
        ),
        const SizedBox(height: 24),
        _buildSection(
          title: "Threat Intel Feeds",
          children: [
            _buildInputLabel("AlienVault OTX API Key"),
            _buildTextField("OTX API Key...."),
            const SizedBox(height: 20),
            _buildInputLabel("VirusTotal API Key"),
            _buildTextField("VT API Key..."),
            const SizedBox(height: 20),
            _buildInputLabel("Shodan API Key"),
            _buildTextField("Shodan API Key..."),
            const SizedBox(height: 20),
            _buildSmallButton("Sync Feeds Now", Icons.sync),
          ],
        ),
      ],
    );
  }

  Widget _buildAuditLogTab() {
    return _buildSection(
      icon: Icons.assignment_outlined,
      title: "AUDIT TRAIL",
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 800,
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1.5),
                3: FlexColumnWidth(3),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: borderColor))),
                  children: [
                    _buildTableHeader("TIME"),
                    _buildTableHeader("USER"),
                    _buildTableHeader("ACTION"),
                    _buildTableHeader("DETAILS"),
                  ],
                ),
                _buildAuditRow("11:45:32", "admin", "login_success", "Dashboard accessed"),
                _buildAuditRow("11:32:15", "admin", "mitigation", "Terminated PID 7712 (xmrig)"),
                _buildAuditRow("11:05:28", "analyst-01", "alert_updated", "Alert #47 status -> investigating"),
                _buildAuditRow("10:55:00", "scheduler", "scan_started", "Full scan initiated (scheduled)"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildAuditRow(String time, String user, String action, String details) {
    return TableRow(
      children: [
        _buildTableCell(time),
        _buildTableCell(user, color: Colors.blueAccent),
        _buildTableCell(action, isBold: true),
        _buildTableCell(details),
      ],
    );
  }

  Widget _buildApiKeysTab() {
    return _buildSection(
      icon: Icons.vpn_key_outlined,
      title: "API KEYS",
      children: [
        _buildInputLabel("YOUR API KEY"),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: inputBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          child: const Text(
            "nex_live_a7f2b1c3d4e5f6g7h8c9d0e1f2a3b4c5d6e7f8a9",
            style: TextStyle(color: Colors.greenAccent, fontFamily: 'monospace', fontSize: 13),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Include this key in requests as: X-API-KEY: NEX_LIVE_... header",
          style: TextStyle(color: subTextColor, fontSize: 11),
        ),
      ],
    );
  }

  /// HELPERS
  Widget _buildSection({IconData? icon, required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) Icon(icon, color: subTextColor, size: 18),
              if (icon != null) const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInputLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(color: subTextColor, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: inputBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: TextField(
        style: const TextStyle(color: textColor, fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: subTextColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildDropdown({required String value, required List<String> items, required Function(String?) onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: inputBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: cardBg,
          style: const TextStyle(color: textColor, fontSize: 13),
          icon: const Icon(Icons.keyboard_arrow_down, color: subTextColor),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildCheckboxTile({required String title, required String subtitle, required bool value, required Function(bool?) onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: accentBlue,
              checkColor: Colors.white,
              side: const BorderSide(color: borderColor),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: textColor, fontSize: 13, fontWeight: FontWeight.w500)),
                Text(subtitle, style: const TextStyle(color: subTextColor, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: inputBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: subTextColor, size: 16),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: textColor, fontSize: 12)),
        ],
      ),
    );
  }

  /// TABLE HELPERS
  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(text, style: const TextStyle(color: subTextColor, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }

  TableRow _buildUserRow(String username, String role, String created, String lastLogin, bool active, {bool showDelete = false}) {
    return TableRow(
      children: [
        _buildTableCell(username, isBold: true),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: _buildBadge(role, Colors.blueGrey.withOpacity(0.3), Colors.white70),
        ),
        _buildTableCell(created),
        _buildTableCell(lastLogin),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: _buildBadge("Active", Colors.green.withOpacity(0.2), Colors.greenAccent),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              _buildActionBtn("Edit", inputBg),
              if (showDelete) const SizedBox(width: 8),
              if (showDelete) _buildActionBtn("Delete", Colors.redAccent.withOpacity(0.8)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(text,
          style: TextStyle(
              color: color ?? (isBold ? textColor : Colors.white70),
              fontSize: 12,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
    );
  }

  Widget _buildBadge(String text, Color bg, Color textColor) {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4)),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 9, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildActionBtn(String text, Color bg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4), border: Border.all(color: borderColor)),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }
}
