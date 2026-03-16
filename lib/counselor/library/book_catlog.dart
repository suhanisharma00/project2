import 'package:flutter/material.dart';

class LibraryBooksPage extends StatelessWidget {
  const LibraryBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B102A),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFF3E466A),
          elevation: 0,
          title: const Row(
            children: [
              Icon(Icons.menu_book_outlined, size: 28),
              SizedBox(width: 10),
              Text(
                "Library Books",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// FILTER CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3E466A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildLabel("Title"),
                  buildTextField("Search Title"),

                  buildLabel("Author"),
                  buildTextField("Search Author"),

                  buildLabel("ISBN"),
                  buildTextField("Search ISBN"),

                  buildLabel("Category"),
                  buildDropdown(),

                  buildLabel("Language"),
                  buildDropdown(),

                  buildLabel("Format"),
                  buildDropdown(),

                  buildLabel("Year"),
                  buildDropdown(),

                  const SizedBox(height: 20),

                  /// Apply & Reset
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4361EE),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "APPLY",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5E6A75),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "RESET",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Icon Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildIconButton(Icons.copy, Colors.blue),
                      buildIconButton(Icons.file_open, Colors.teal),
                      buildIconButton(Icons.table_chart, Colors.green),
                      buildIconButton(Icons.picture_as_pdf, Colors.red),
                      buildIconButton(Icons.print, Colors.black),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// ================= SHOW ENTRIES CARD =================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3E466A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Show Entries",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  const SizedBox(height: 15),

                  buildTextField("search"),

                  const SizedBox(height: 15),

                  /// Horizontal Scroll Table
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor:
                      MaterialStateProperty.all(const Color(0xFF4B557D)),
                      columns: const [
                        DataColumn(label: Text("#")),
                        DataColumn(label: Text("Title")),
                        DataColumn(label: Text("Author")),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text("1")),
                          DataCell(Text("Basics of Auditing")),
                          DataCell(Text("N. Patel")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("2")),
                          DataCell(Text("Advanced Taxation Concepts")),
                          DataCell(Text("M. R. Shah")),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ========== Common Widgets ==========

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }

  Widget buildTextField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF5E6A75),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF5E6A75),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: const Color(0xFF3E466A),
          value: "All",
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          items: const [
            DropdownMenuItem(
                value: "All",
                child: Text("All", style: TextStyle(color: Colors.white))),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, color: borderColor),
        onPressed: () {},
      ),
    );
  }
}
