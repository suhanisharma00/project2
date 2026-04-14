import 'package:flutter/material.dart';
import 'add_ioc.dart';

class ThreatIntelPage extends StatefulWidget {
  const ThreatIntelPage({super.key});

  @override
  State<ThreatIntelPage> createState() => _ThreatIntelPageState();
}

class _ThreatIntelPageState extends State<ThreatIntelPage> {
  static const Color bgColor = Color(0xFF0B1221);
  static const Color cardColor = Color(0xFF1E293B);
  static const Color accentBlue = Colors.blue;
  static const Color accentRed = Colors.redAccent;
  static const Color accentYellow = Colors.orangeAccent;
  static const Color accentPurple = Colors.purpleAccent;
  static const Color accentGreen = Colors.tealAccent;

  bool showDetailedTable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "NexusEDR / Threat Intelligence",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.dark_mode_outlined, color: Colors.white70),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Threat Intelligence",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "IOC MANAGEMENT · IP · DOMAINS · HASHES · REAL-TIME MATCHING",
                      style: TextStyle(color: Colors.white38, fontSize: 10),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white70),
                  color: cardColor,
                  onSelected: (value) {
                    if (value == 'show_data') {
                      setState(() {
                        showDetailedTable = !showDetailedTable;
                      });
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'show_data',
                      child: Text(
                        showDetailedTable ? "Hide Detailed Data" : "Show Detailed Data",
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'refresh',
                      child: Text(
                        "Refresh Feed",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Action Buttons
            Row(
              children: [
                Expanded(
                  child: _actionButton(
                    text: "Import Feed",
                    onPressed: () {},
                    isFilled: false,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _actionButton(
                    text: "+ Add IOC",
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: "AddIoc",
                        pageBuilder: (context, anim1, anim2) => const AddIocPage(),
                      );
                    },
                    isFilled: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: const [
                StatBox(title: "Total IOCs", value: "1,284", color: accentBlue),
                StatBox(title: "IP Addresses", value: "412", color: accentRed),
                StatBox(title: "Domains", value: "538", color: accentYellow),
                StatBox(title: "File Hashes", value: "334", color: accentPurple),
              ],
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const StatBox(title: "Matches (7d)", value: "8", color: accentGreen),
              ),
            ),
            const SizedBox(height: 24),

            /// Search & Filter
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: cardColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.white38, size: 18),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            decoration: InputDecoration(
                              hintText: "Search IOCs, threat actors...",
                              hintStyle: TextStyle(color: Colors.white38, fontSize: 13),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "FILTER",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// Detailed Data
            if (showDetailedTable) ...[
              const Text(
                "IOC LISTING",
                style: TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _iocItem(
                type: "IP",
                value: "45.33.32.156",
                threat: "APT28 C2 Server",
                severity: "CRITICAL",
                source: "Kama01",
                time: "14:28 today",
                color: accentRed,
              ),
              _iocItem(
                type: "DOMAIN",
                value: "post.support-serv.com",
                threat: "DPRK Mining Pool",
                severity: "HIGH",
                source: "Bust04",
                time: "14:11 today",
                color: accentYellow,
              ),
              _iocItem(
                type: "IP",
                value: "185.220.101.43",
                threat: "Tor Exit Node",
                severity: "HIGH",
                source: "Feeds-TW",
                time: "Yesterday",
                color: accentYellow,
              ),
              _iocItem(
                type: "HASH",
                value: "a1b2c3d4e5f6g7h8...",
                threat: "Trojan.GenericKD.91",
                severity: "CRITICAL",
                source: "VirusShare",
                time: "13:45 today",
                color: accentRed,
              ),
            ] else
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Icon(Icons.list_alt, color: Colors.white10, size: 64),
                      SizedBox(height: 16),
                      Text(
                        "Detailed data hidden.\nClick 'Show Detailed Data' from the menu.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white24, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _actionButton({required String text, required VoidCallback onPressed, required bool isFilled}) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFilled ? Colors.blueAccent : Colors.transparent,
          side: isFilled ? BorderSide.none : const BorderSide(color: Colors.white24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _iocItem({
    required String type,
    required String value,
    required String threat,
    required String severity,
    required String source,
    required String time,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(4)),
                child: Text(type, style: const TextStyle(color: Colors.white70, fontSize: 9, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
                child: Text(severity, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(threat, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const Divider(color: Colors.white10, height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Source: $source", style: const TextStyle(color: Colors.white38, fontSize: 10)),
              Text(time, style: const TextStyle(color: Colors.white38, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StatBox({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(10),
        border: Border(top: BorderSide(color: color, width: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white54, fontSize: 11),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
