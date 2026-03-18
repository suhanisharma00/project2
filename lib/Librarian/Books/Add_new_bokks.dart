import 'package:flutter/material.dart';
import 'All_Books.dart';

class AddNewBookPage extends StatefulWidget {
  const AddNewBookPage({super.key});

  @override
  State<AddNewBookPage> createState() => _AddNewBookPageState();
}

class _AddNewBookPageState extends State<AddNewBookPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);
  static const Color resetBtn = Color(0xFF94A3B8);

  String selectedFormat = "Hardcover";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.menu_book, color: Colors.blueAccent),
        title: const Text("Add New Book",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const AllBooksPage()),
                  );
                },
                icon: const Icon(Icons.list, size: 14, color: Colors.white70),
                label: const Text("BACK TO BOOKS",
                    style: TextStyle(fontSize: 10, color: Colors.white70)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  minimumSize: const Size(0, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.white10)),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// BOOK DETAILS SECTION
            buildSectionContainer(
              icon: Icons.info,
              title: "Book Details",
              subtitle: "Provide the core information about the book.",
              children: [
                buildInputField("Title *", ""),
                buildInputField("Author *", ""),
                buildInputField("Edition", ""),
                buildInputField("Volume", ""),
                buildInputField("Publisher", ""),
                buildInputField("Publication Year", ""),
              ],
            ),

            const SizedBox(height: 20),

            /// CATALOG & INVENTORY SECTION
            buildSectionContainer(
              icon: Icons.sell,
              title: "Catalog & Inventory",
              children: [
                buildInputField("ISBN", ""),
                buildInputField("Category", ""),
                buildInputField("Language", "English"),
                buildDropdownField("Format", selectedFormat,
                    ["Hardcover", "Paperback", "E-book"], (val) {
                  setState(() => selectedFormat = val!);
                }),
                buildInputField("Format", "1"), // As per image label
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt, size: 18, color: Colors.white),
                    label: const Text("APPLY FILTERS",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh, size: 18, color: Colors.black),
                    label: const Text("RESET FILTERS",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF94A3B8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// MAIN ADD BOOK BUTTON
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text("ADD BOOK",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B82F6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildSectionContainer(
      {required IconData icon,
      required String title,
      String? subtitle,
      required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blueAccent, size: 24),
              const SizedBox(width: 10),
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle,
                style: const TextStyle(color: Colors.white38, fontSize: 12)),
          ],
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget buildInputField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          TextField(
            controller: TextEditingController(text: value),
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              filled: true,
              fillColor: fieldColor,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField(String label, String value, List<String> items,
      Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: fieldColor, borderRadius: BorderRadius.circular(8)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                dropdownColor: fieldColor,
                icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                items: items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
