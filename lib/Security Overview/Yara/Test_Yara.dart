import 'package:flutter/material.dart';

class TestYaraPage extends StatefulWidget {
  const TestYaraPage({super.key});

  @override
  State<TestYaraPage> createState() => _TestYaraPageState();
}

class _TestYaraPageState extends State<TestYaraPage> {
  static const Color bgColor = Color(0xFF0B1221);
  static const Color cardColor = Color(0xFF1E293B);
  static const Color borderColor = Colors.white12;
  static const Color textColor = Colors.white;
  static const Color secondaryTextColor = Colors.white38;
  static const Color blueAccent = Colors.blueAccent;

  String selectedRule = "WebShell_PHP_Generic";
  final List<String> rules = [
    "WebShell_PHP_Generic",
    "CryptoMiner_XMRig",
    "Ransomware_Indicators",
    "TestRule_Experimental"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.science, color: Colors.pinkAccent, size: 24),
                      SizedBox(width: 12),
                      Text(
                        "Test YARA Rule",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.cancel, color: Colors.white24, size: 28),
                  ),
                ],
              ),
              const Divider(color: borderColor, height: 32),

              /// Select Rule Dropdown
              const Text(
                "Select Rule",
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
                    value: selectedRule,
                    isExpanded: true,
                    dropdownColor: cardColor,
                    style: const TextStyle(color: textColor, fontSize: 14),
                    icon: const Icon(Icons.keyboard_arrow_down, color: textColor),
                    items: rules.map((String rule) {
                      return DropdownMenuItem<String>(
                        value: rule,
                        child: Text(rule),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedRule = val!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              /// Test File Path
              const Text(
                "Test File Path",
                style: TextStyle(color: secondaryTextColor, fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextField(
                style: const TextStyle(color: textColor, fontSize: 14),
                decoration: InputDecoration(
                  hintText: "/path/to/suspicious/file",
                  hintStyle: const TextStyle(color: secondaryTextColor),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: blueAccent),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Results Preview Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor),
                ),
                child: const Text(
                  "Results will appear here after testing.",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
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
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Run Test",
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
}
