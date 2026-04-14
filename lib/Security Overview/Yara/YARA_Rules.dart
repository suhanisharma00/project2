import 'package:flutter/material.dart';

import 'Test_Yara.dart';
import 'new_yara.dart';

class YaraRulesPage extends StatefulWidget {
  const YaraRulesPage({super.key});

  @override
  State<YaraRulesPage> createState() => _YaraRulesPageState();
}

class _YaraRulesPageState extends State<YaraRulesPage> {
  static const Color bgColor = Color(0xFF0B1221);
  static const Color cardColor = Color(0xFF1E293B);
  static const Color accentBlue = Colors.blue;
  static const Color accentRed = Colors.redAccent;
  static const Color accentYellow = Colors.orangeAccent;
  static const Color accentPurple = Colors.purpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          "NexusEDR / YARA Rules",
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "YARA Detection Rules",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "47 RULES ACTIVE · CUSTOM PATTERN MATCHING · FILE & PROCESS SCANNING",
                      style: TextStyle(color: Colors.white38, fontSize: 10),
                    ),
                  ],
                ),
                Icon(Icons.more_vert, color: Colors.white70),
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
                StatBox(title: "Active Rules", value: "47", color: accentBlue),
                StatBox(title: "Disabled", value: "3", color: accentRed),
                StatBox(title: "Matches (7d)", value: "12", color: accentYellow),
                StatBox(title: "Critical Rules", value: "8", color: accentPurple),
              ],
            ),
            const SizedBox(height: 24),

            /// Action Buttons (Test / New)
            Row(
              children: [
                Expanded(
                  child: ActionButton(
                    text: "Test Rule",
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TestYaraPage())),
                    isFilled: false,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActionButton(
                    text: "+ New Rule",
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NewYaraPage())),
                    isFilled: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            /// Rule List
            const RuleListItem(
              title: "WebShell_PHP_Generic",
              subtitle: "Created 01 Mar 2026 - by admin - Last match: 14:28 today",
              status: "ENABLED",
              severity: "CRITICAL",
              matches: "12 MATCHES",
              accentColor: accentRed,
            ),
            const RuleListItem(
              title: "CryptoMiner_XMRig",
              subtitle: "Created 28 Feb 2026 - by admin - Last match: 14:11 today",
              status: "ENABLED",
              severity: "HIGH",
              matches: "3 MATCHES",
              accentColor: accentYellow,
            ),
            const RuleListItem(
              title: "Ransomware_Indicators",
              subtitle: "Created 25 Feb 2026 - by analyst-01 - No matches yet",
              status: "ENABLED",
              severity: "CRITICAL",
              matches: "0 MATCHES",
              accentColor: accentRed,
            ),
            const RuleListItem(
              title: "TestRule_Experimental",
              subtitle: "Created 20 Feb 2026 - Disabled for review",
              status: "DISABLED",
              severity: "LOW",
              matches: "",
              accentColor: Colors.grey,
              isDisabled: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _YaraRulesPageState.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border(top: BorderSide(color: color, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFilled;

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFilled ? Colors.blueAccent : Colors.transparent,
          side: isFilled ? BorderSide.none : const BorderSide(color: Colors.white24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class RuleListItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String status;
  final String severity;
  final String matches;
  final Color accentColor;
  final bool isDisabled;

  const RuleListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.severity,
    required this.matches,
    required this.accentColor,
    this.isDisabled = false,
  });

  @override
  State<RuleListItem> createState() => _RuleListItemState();
}

class _RuleListItemState extends State<RuleListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _YaraRulesPageState.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: widget.accentColor, width: 4)),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.isDisabled ? Colors.white38 : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _badge(widget.severity, widget.accentColor.withOpacity(0.2), widget.accentColor),
                    const SizedBox(width: 4),
                    _badge(widget.status, Colors.blue.withOpacity(0.1), Colors.blue),
                    if (widget.matches.isNotEmpty) ...[
                      const SizedBox(width: 4),
                      _badge(widget.matches, Colors.white12, Colors.white70),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  widget.subtitle,
                  style: const TextStyle(color: Colors.white38, fontSize: 11),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded ? Icons.close : Icons.more_vert,
                color: Colors.white70,
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionBtn("View Rule", Colors.white12),
                  _actionBtn("Edit", Colors.white12),
                  _actionBtn("Disable", Colors.white12),
                  _actionBtn("Delete", Colors.redAccent.withOpacity(0.8)),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _badge(String text, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 9, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _actionBtn(String text, Color bg) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }
}
