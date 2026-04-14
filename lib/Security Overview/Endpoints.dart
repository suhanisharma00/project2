import 'package:flutter/material.dart';

class EndpointsPage extends StatefulWidget {
  const EndpointsPage({super.key});

  @override
  State<EndpointsPage> createState() => _EndpointsPageState();
}

class _EndpointsPageState extends State<EndpointsPage> {
  static const Color bgColor = Color(0xFF070B1D);
  static const Color cardBg = Color(0xFF11172D);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color textColor = Colors.white;
  static const Color subTextColor = Colors.white54;
  static const Color borderColor = Colors.white10;

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
          "NexusEDR / Alerts",
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
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Protected Endpoints",
                        style: TextStyle(color: textColor, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "8 AGENTS ONLINE · GO AGENT v1.0.0 · REAL-TIME HEARTBEAT",
                        style: TextStyle(color: subTextColor, fontSize: 10, letterSpacing: 0.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2236),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: borderColor),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.upload_outlined, color: Colors.amber, size: 16),
                      SizedBox(width: 8),
                      Text("Deploy Agent", style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.6,
              children: [
                _buildStatCard("Online", "8", Colors.redAccent),
                _buildStatCard("Offline", "0", Colors.amber),
                _buildStatCard("High Risk", "2", Colors.blueAccent),
                _buildStatCard("Total Alerts", "94", Colors.tealAccent),
              ],
            ),
            const SizedBox(height: 24),

            /// Endpoint List
            _buildEndpointCard(
              name: "SRV-WEB-02",
              os: "Ubuntu 22.04 - 192.168.1.102",
              alerts: "7",
              lastSeen: "1m ago",
              agent: "v1.0.0",
            ),
            const SizedBox(height: 16),
            _buildEndpointCard(
              name: "SRV-DB-01",
              os: "Debian 11 - 192.168.1.10",
              alerts: "0",
              lastSeen: "1m ago",
              agent: "v1.0.0",
            ),
            const SizedBox(height: 24),

            /// Agent Deployment
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.storage_outlined, color: subTextColor, size: 20),
                      SizedBox(width: 8),
                      Text("Agent Deployment", style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _DeploymentTab(label: "Linux / Debian", isActive: true),
                      _DeploymentTab(label: "Windows"),
                      _DeploymentTab(label: "macOS"),
                    ],
                  ),
                  const Divider(color: borderColor, height: 1),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF070B1D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "# Install NexusEDR agent (Debian/Ubuntu)\nsudo dpkg -i nexus-edr_1.0.0_amd64.deb\n\n# Configure server URL\nsudo nano /etc/nexus-edr/agent.json\n# Set \"server_url\": \"http://YOUR_SERVER_IP:5000\"\n\n# Enable autostart\nsudo systemctl enable nexus-agent\nsudo systemctl start nexus-agent\n\n# Verify status\nsudo systemctl status nexus-agent",
                      style: TextStyle(color: successGreen, fontFamily: 'monospace', fontSize: 12, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border(top: BorderSide(color: color.withOpacity(0.5), width: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: subTextColor, fontSize: 12)),
          const Spacer(),
          Text(value, style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildEndpointCard({
    required String name,
    required String os,
    required String alerts,
    required String lastSeen,
    required String agent,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(4)),
                child: const Icon(Icons.computer, color: Colors.white24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(os, style: const TextStyle(color: subTextColor, fontSize: 11)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: successGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: successGreen.withOpacity(0.5))),
                child: const Text("Online", style: TextStyle(color: successGreen, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildInfoBox("Alerts", alerts, color: alerts == "0" ? successGreen : Colors.tealAccent),
              const SizedBox(width: 8),
              _buildInfoBox("Last Seen", lastSeen),
              const SizedBox(width: 8),
              _buildInfoBox("Agent", agent),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(color: const Color(0xFF1B2236), borderRadius: BorderRadius.circular(4)),
            child: const Text("View Alerts", style: TextStyle(color: subTextColor, fontSize: 11)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: const Color(0xFFF44336).withOpacity(0.8), borderRadius: BorderRadius.circular(4)),
                  child: const Text("Isolate", style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: const Color(0xFF1B2236), borderRadius: BorderRadius.circular(4)),
                  child: const Text("Scan", style: TextStyle(color: subTextColor, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoBox(String title, String value, {Color color = subTextColor}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: const Color(0xFF1B2236), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: subTextColor, fontSize: 10)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _DeploymentTab extends StatelessWidget {
  final String label;
  final bool isActive;
  const _DeploymentTab({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label,
            style: TextStyle(
                color: isActive ? Colors.blue : Colors.white54, // Used direct value to fix undefined name
                fontSize: 12)),
        const SizedBox(height: 8),
        if (isActive) Container(height: 2, width: 60, color: Colors.blue),
      ],
    );
  }
}
