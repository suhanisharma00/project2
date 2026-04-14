import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

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
              const Text("NexusEDR / ", style: TextStyle(color: Colors.white54, fontSize: 14)),
              const Text("Analytics", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              _buildFilterBadge("Last 30 Days"),
              const SizedBox(width: 12),
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
            _buildSectionHeader(),
            const SizedBox(height: 24),
            _buildAlertVolumeSection(),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 800) {
                  return Column(
                    children: [
                      _buildEngineDistribution(),
                      const SizedBox(height: 24),
                      _buildRiskByHost(),
                      const SizedBox(height: 24),
                      _buildDetectionSources(),
                    ],
                  );
                }
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildEngineDistribution()),
                        const SizedBox(width: 20),
                        Expanded(child: _buildRiskByHost()),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildDetectionSources(),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            _buildMitreCoverageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white70, size: 14),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Threat Analytics", style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildSubOption("30-DAY TREND", isSelected: true),
              _buildSubOption("MITRE ATT&CK MAPPING"),
              _buildSubOption("ENGINE PERFORMANCE"),
              _buildSubOption("HOST RISK"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubOption(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? accentBlue : Colors.white38,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: accentBlue,
            ),
        ],
      ),
    );
  }

  Widget _buildAlertVolumeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.bar_chart, color: accentBlue, size: 20),
                  SizedBox(width: 8),
                  Text("Alert Volume", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  _buildTabItem("Daily", isSelected: true),
                  _buildTabItem("Weekly"),
                  _buildTabItem("Monthly"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildChartLegend(),
          const SizedBox(height: 20),
          Container(
            height: 200,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(15, (index) => _buildStackedBar(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? accentBlue.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? accentBlue : Colors.white38,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildChartLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildLegendDot("Critical", criticalRed),
        const SizedBox(width: 12),
        _buildLegendDot("High", severityHigh),
        const SizedBox(width: 12),
        _buildLegendDot("Medium", accentBlue),
        const SizedBox(width: 12),
        _buildLegendDot("Low", successGreen),
      ],
    );
  }

  Widget _buildLegendDot(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.rectangle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.white38, fontSize: 9)),
      ],
    );
  }

  Widget _buildStackedBar(int index) {
    return Container(
      width: 12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(height: (index % 5 + 1) * 5.0, color: criticalRed),
          Container(height: (index % 3 + 1) * 10.0, color: severityHigh),
          Container(height: (index % 4 + 1) * 8.0, color: accentBlue),
          Container(height: (index % 2 + 1) * 12.0, color: successGreen),
          const SizedBox(height: 4),
          Text("${index + 10} May", style: const TextStyle(color: Colors.white24, fontSize: 7)),
        ],
      ),
    );
  }

  Widget _buildEngineDistribution() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.settings_input_component, color: Colors.white38, size: 18),
              SizedBox(width: 8),
              Text("ENGINE DISTRIBUTION", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const CircularProgressIndicator(value: 0.6, strokeWidth: 15, color: accentBlue, backgroundColor: Colors.white12),
                  const CircularProgressIndicator(value: 0.35, strokeWidth: 15, color: Colors.purpleAccent),
                  const CircularProgressIndicator(value: 0.15, strokeWidth: 15, color: Colors.teal),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildEngineLegend(),
        ],
      ),
    );
  }

  Widget _buildEngineLegend() {
    return Column(
      children: [
        _buildEngineLegendItem("Behaviour Engine", successGreen),
        const SizedBox(height: 8),
        _buildEngineLegendItem("Signature Engine", accentBlue),
        const SizedBox(height: 8),
        _buildEngineLegendItem("Yara Engine", Colors.purpleAccent),
      ],
    );
  }

  Widget _buildEngineLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(width: 8, height: 8, color: color),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }

  Widget _buildRiskByHost() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.computer, color: criticalRed, size: 18),
              SizedBox(width: 8),
              Text("Risk by Host", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          _buildHostRiskRow("SRV-WEB-02", 0.9, "CRITICAL", criticalRed),
          _buildHostRiskRow("LAPTOP-DEV-03", 0.6, "HIGH", severityHigh),
          _buildHostRiskRow("WS-MKTG-07", 0.45, "MEDIUM", accentBlue),
          _buildHostRiskRow("SRV-API-01", 0.4, "MEDIUM", accentBlue),
          _buildHostRiskRow("SRV-DB-01", 0.2, "LOW", successGreen),
        ],
      ),
    );
  }

  Widget _buildHostRiskRow(String name, double value, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold)),
              Text(label, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(value: value, color: color, backgroundColor: Colors.white12, minHeight: 6),
        ],
      ),
    );
  }

  Widget _buildDetectionSources() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.radar, color: successGreen, size: 18),
              SizedBox(width: 8),
              Text("Detection Sources", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: CircularProgressIndicator(
                      value: 0.75,
                      strokeWidth: 20,
                      color: Colors.orangeAccent,
                      backgroundColor: Colors.tealAccent.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEngineLegendItem("Process Monitor", Colors.orangeAccent),
                    const SizedBox(height: 12),
                    _buildEngineLegendItem("Network Monitor", Colors.tealAccent),
                    const SizedBox(height: 12),
                    _buildEngineLegendItem("File Monitor", Colors.purpleAccent),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMitreCoverageSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.security, color: Colors.white38, size: 18),
              SizedBox(width: 8),
              Text("MITRE ATT&CK Technique Coverage", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 30,
              headingRowHeight: 40,
              dataRowHeight: 50,
              columns: const [
                DataColumn(label: Text("Technique ID", style: TextStyle(color: Colors.white38, fontSize: 11))),
                DataColumn(label: Text("Technique Name", style: TextStyle(color: Colors.white38, fontSize: 11))),
                DataColumn(label: Text("Tactic", style: TextStyle(color: Colors.white38, fontSize: 11))),
                DataColumn(label: Text("Detections", style: TextStyle(color: Colors.white38, fontSize: 11))),
                DataColumn(label: Text("Coverage", style: TextStyle(color: Colors.white38, fontSize: 11))),
                DataColumn(label: Text("Status", style: TextStyle(color: Colors.white38, fontSize: 11))),
              ],
              rows: [
                _buildMitreRow("T1059", "Command and Scripting Interpreter", "EXECUTION", "23", 0.8, criticalRed),
                _buildMitreRow("T1498", "Resource Hijacking", "IMPACT", "18", 0.6, severityHigh),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildMitreRow(String id, String name, String tactic, String detections, double coverage, Color color) {
    return DataRow(
      cells: [
        DataCell(Text(id, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(Text(name, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(Text(tactic, style: const TextStyle(color: Colors.white24, fontSize: 9, fontWeight: FontWeight.bold))),
        DataCell(Text(detections, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold))),
        DataCell(
          SizedBox(
            width: 80,
            child: LinearProgressIndicator(value: coverage, color: color, backgroundColor: Colors.white10, minHeight: 3),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: accentBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(10), border: Border.all(color: accentBlue.withOpacity(0.5))),
            child: const Text("MONITORED", style: TextStyle(color: accentBlue, fontSize: 8, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
