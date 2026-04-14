import 'package:flutter/material.dart';

class NewYaraPage extends StatefulWidget {
  const NewYaraPage({super.key});

  @override
  State<NewYaraPage> createState() => _NewYaraPageState();
}

class _NewYaraPageState extends State<NewYaraPage> {
  static const Color bgColor = Color(0xFF0B1221);
  static const Color cardColor = Color(0xFF1E293B);
  static const Color borderColor = Colors.white12;
  static const Color textColor = Colors.white;
  static const Color secondaryTextColor = Colors.white38;
  static const Color blueAccent = Colors.blueAccent;

  String selectedRuleName = "MyMalwareRule";
  final List<String> ruleNames = ["MyMalwareRule", "WebShellRule", "CryptoRule"];

  final String ruleContent = """rule WebShell_PHP_Generic {
    meta:
        description = "Detects PHP web shells"
        severity = "critical"
    strings:
        \$php1 = "<?php" nocase
        \$exec1 = "exec(" nocase
        \$exec2 = "shell_exec(" nocase
        \$eval = "eval(" nocase
        \$b64 = "base64_decode(" nocase
    condition:
        \$php1 and any of (\$exec*, \$eval) and \$b64
}""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              const Row(
                children: [
                  Icon(Icons.description_outlined, color: Colors.white70, size: 24),
                  SizedBox(width: 12),
                  Text(
                    "New YARA Rule",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(color: borderColor, height: 32),

              /// Rule Name
              const Text(
                "Rule Name",
                style: TextStyle(color: secondaryTextColor, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedRuleName,
                    isExpanded: true,
                    dropdownColor: cardColor,
                    style: const TextStyle(color: textColor, fontSize: 14),
                    icon: const Icon(Icons.keyboard_arrow_down, color: textColor),
                    items: ruleNames.map((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => selectedRuleName = val!),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Templates
              Row(
                children: [
                  const Text(
                    "Templates: ",
                    style: TextStyle(color: secondaryTextColor, fontSize: 14),
                  ),
                  const SizedBox(width: 8),
                  _templateChip("Web Shell"),
                  _templateChip("Crypto Minor"),
                  _templateChip("Ransomware"),
                  _templateChip("Reverse Shell"),
                ],
              ),
              const SizedBox(height: 24),

              /// YARA Rule Content
              const Text(
                "YARA Rule Content",
                style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                child: Text(
                  ruleContent,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontFamily: 'monospace',
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              /// Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: borderColor),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      "Cancle",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Save Rull",
                      style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _templateChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 11),
      ),
    );
  }
}
