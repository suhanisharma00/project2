import 'package:flutter/material.dart';

class AddIocPage extends StatefulWidget {
  const AddIocPage({super.key});

  @override
  State<AddIocPage> createState() => _AddIocPageState();
}

class _AddIocPageState extends State<AddIocPage> {
  static const Color bgColor = Color(0xFF0B1221);
  static const Color inputBg = Color(0xFF161B2E);
  static const Color textColor = Colors.white;
  static const Color secondaryTextColor = Colors.white38;
  static const Color blueAccent = Colors.blueAccent;

  String? selectedType;
  String selectedSeverity = "Medium";

  final List<String> iocTypes = ["IP", "Domain", "Hash", "URL"];
  final List<String> severities = ["Low", "Medium", "High", "Critical"];

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
            border: Border.all(color: Colors.white10),
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
                      Icon(Icons.language, color: Colors.blueAccent, size: 24),
                      SizedBox(width: 12),
                      Text(
                        "Add IOC",
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
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(Icons.close, color: Colors.white54, size: 20),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white10, height: 32),

              /// IOC Type
              _label("IOC Type"),
              const SizedBox(height: 8),
              _dropdown(
                hint: "IOC Type",
                value: selectedType,
                items: iocTypes,
                onChanged: (val) => setState(() => selectedType = val),
              ),
              const SizedBox(height: 20),

              /// IOC Value
              _label("IOC VALUE"),
              const SizedBox(height: 8),
              _textField("192.168.1.1 or evil.com or hash..."),
              const SizedBox(height: 20),

              /// Threat Name
              _label("THREAT NAME / ACTOR"),
              const SizedBox(height: 8),
              _textField("APT28, Cobalt Strike, ect."),
              const SizedBox(height: 20),

              /// Severity (Labeled as Threat Name / Actor in image)
              _label("THREAT NAME / ACTOR"),
              const SizedBox(height: 8),
              _dropdown(
                hint: "Medium",
                value: selectedSeverity,
                items: severities,
                onChanged: (val) => setState(() => selectedSeverity = val!),
              ),
              const SizedBox(height: 32),

              /// Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Cancle",
                        style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Add IOC",
                        style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
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

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(color: secondaryTextColor, fontSize: 12, fontWeight: FontWeight.bold),
    );
  }

  Widget _dropdown({required String hint, required String? value, required List<String> items, required Function(String?) onChanged}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: inputBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint, style: const TextStyle(color: secondaryTextColor, fontSize: 13)),
          isExpanded: true,
          dropdownColor: bgColor,
          style: const TextStyle(color: textColor, fontSize: 13),
          icon: const Icon(Icons.keyboard_arrow_down, color: secondaryTextColor, size: 20),
          items: items.map((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _textField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: inputBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: const TextStyle(color: textColor, fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: secondaryTextColor, fontSize: 13),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
