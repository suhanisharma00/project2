import 'package:flutter/material.dart';

class AllBooksPage extends StatefulWidget {
  const AllBooksPage({super.key});

  @override
  State<AllBooksPage> createState() => _AllBooksPageState();
}

class _AllBooksPageState extends State<AllBooksPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color purpleBtn = Color(0xFF7E57C2);
  static const Color greyBtn = Color(0xFFB0BEC5);

  String selectedCategory = "All";
  String selectedLanguage = "All";
  String selectedFormat = "All";
  String selectedYear = "All";
  String selectedAvailability = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.menu_book, color: Colors.blueAccent),
        title: const Text("Books Management", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline, size: 14, color: Colors.white),
                label: const Text("ADD NEW BOOK", style: TextStyle(fontSize: 10, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  minimumSize: const Size(0, 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
            /// FILTER BOOKS SECTION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.filter_alt, color: Colors.blueAccent, size: 18),
                      SizedBox(width: 8),
                      Text("FILTER BOOKS", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  buildInputField("Title", "Book Title"),
                  buildInputField("Author", "Author Name"),
                  buildInputField("ISBN", "ISBN"),
                  buildDropdownField("Category", selectedCategory, ["All", "Auditing", "Taxation", "Management"], (val) => setState(() => selectedCategory = val!)),
                  buildDropdownField("Language", selectedLanguage, ["All", "English", "Hindi", "Spanish"], (val) => setState(() => selectedLanguage = val!)),
                  buildDropdownField("Format", selectedFormat, ["All", "Hardcover", "Paperback", "E-book"], (val) => setState(() => selectedFormat = val!)),
                  buildDropdownField("Year", selectedYear, ["All", "2024", "2023", "2022", "2021", "2020"], (val) => setState(() => selectedYear = val!)),
                  buildDropdownField("Availability", selectedAvailability, ["All", "Available", "Out of Stock"], (val) => setState(() => selectedAvailability = val!)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt, size: 18, color: Colors.white),
                      label: const Text("FILTER", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      style: ElevatedButton.styleFrom(backgroundColor: purpleBtn, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh, size: 18, color: bgColor),
                      label: const Text("RESET", style: TextStyle(fontWeight: FontWeight.bold, color: bgColor)),
                      style: ElevatedButton.styleFrom(backgroundColor: greyBtn, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// BOOK LIST
            bookCard("Basics of Auditing", "N. Patel", "978-81-55443-21-7", "Auditing", "English", "2020", "40", "40"),
            bookCard("Advanced Taxation Concepts", "M. R. Shah", "978-81-11223-45-6", "Taxation", "English", "2024", "25", "23"),
          ],
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 6),
          TextField(
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
              filled: true,
              fillColor: fieldColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField(String label, String value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(4)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                dropdownColor: fieldColor,
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bookCard(String title, String author, String isbn, String category, String language, String year, String total, String available) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text("by $author", style: const TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 12),
          const Divider(color: Colors.white10),
          const SizedBox(height: 12),
          detailRow(Icons.info_outline, "ISBN:", isbn),
          detailRow(Icons.sell_outlined, "Category:", category),
          detailRow(Icons.language_outlined, "Language:", language),
          detailRow(Icons.calendar_today_outlined, "Year:", year),
          detailRow(Icons.layers_outlined, "Total Copies:", total),
          detailRow(Icons.check_circle_outline, "Available:", available, isAvailable: true),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_square, color: Colors.blueAccent, size: 20),
                style: IconButton.styleFrom(backgroundColor: Colors.white10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.redAccent, size: 20),
                style: IconButton.styleFrom(backgroundColor: Colors.white10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget detailRow(IconData icon, String label, String value, {bool isAvailable = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.white38, size: 14),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 12)),
          const SizedBox(width: 4),
          Text(value, style: TextStyle(color: isAvailable ? Colors.greenAccent : Colors.white70, fontSize: 12, fontWeight: isAvailable ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
