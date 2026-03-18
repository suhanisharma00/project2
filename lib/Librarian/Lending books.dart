import 'package:flutter/material.dart';

class MyLendingBooksPage extends StatefulWidget {
  const MyLendingBooksPage({super.key});

  @override
  State<MyLendingBooksPage> createState() => _MyLendingBooksPageState();
}

class _MyLendingBooksPageState extends State<MyLendingBooksPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);
  static const Color resetBtn = Color(0xFFB0BEC5);

  final TextEditingController _dateFromController = TextEditingController();
  final TextEditingController _dateToController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: blueBtn,
              onPrimary: Colors.white,
              surface: cardColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: bgColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.menu_book, color: Color(0xFFE11D48)),
        title: const Text("My Lending Books",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// FILTER SECTION
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
                      Icon(Icons.filter_alt, color: Colors.blueAccent, size: 20),
                      SizedBox(width: 8),
                      Text("Filter My Lending Books",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildLabel("Book Title"),
                  buildInputField("e.g Math, Physics"),
                  buildLabel("Due Date From"),
                  buildDateField(_dateFromController),
                  buildLabel("Due Date To"),
                  buildDateField(_dateToController),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt, size: 18, color: Colors.white),
                      label: const Text("APPLY FILTERS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _dateFromController.clear();
                          _dateToController.clear();
                        });
                      },
                      icon: const Icon(Icons.refresh, size: 18, color: Colors.black),
                      label: const Text("RESET FILTERS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: resetBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// RECORDS SECTION
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
                      Icon(Icons.list, color: Color(0xFFE11D48), size: 24),
                      SizedBox(width: 10),
                      Text("Lending Records",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 34.0),
                    child: Text("A list of all books you have lent to others.",
                        style: TextStyle(color: Colors.white54, fontSize: 12)),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Search: ", style: TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 34,
                          decoration: BoxDecoration(
                            color: fieldColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.white12),
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      exportBtn("COPY", Icons.copy, Colors.blue),
                      exportBtn("CSV", Icons.description, Colors.teal),
                      exportBtn("EXCEL", Icons.table_chart, Colors.green),
                      exportBtn("PDF", Icons.picture_as_pdf, Colors.red),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 34,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.print, size: 16, color: Colors.white60),
                      label: const Text("PRINT", style: TextStyle(color: Colors.white60, fontSize: 12)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: fieldColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// HORIZONTAL SCROLL TABLE
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(const Color(0xFF2D3748)),
                      columnSpacing: 25,
                      columns: const [
                        DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("ISSUE ID", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("BOOK ID", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("BOOK TITLE", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("ISSUED AT", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("DUE DATE", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("DATE OVERDUE", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("DATE OVERDUE", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        buildDataRow("1", "3", "4", "Advanced\nTaxation\nConcepts", "09 Nov 2025", "30 Nov 2025"),
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

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

  Widget buildInputField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
        filled: true,
        fillColor: fieldColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
      ),
    );
  }

  Widget buildDateField(TextEditingController controller) {
    return InkWell(
      onTap: () => _selectDate(context, controller),
      child: IgnorePointer(
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: "dd-mm-yyyy",
            hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
            filled: true,
            fillColor: fieldColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            suffixIcon: const Icon(Icons.calendar_month, color: Colors.white38, size: 18),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }

  Widget exportBtn(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  DataRow buildDataRow(String hash, String issueId, String bookId, String title, String issuedAt, String dueDate) {
    return DataRow(cells: [
      DataCell(Text(hash, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(issueId, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(bookId, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(title, style: const TextStyle(color: Colors.white, fontSize: 12))),
      DataCell(Text(issuedAt, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(dueDate, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: Colors.green.withOpacity(0.8), borderRadius: BorderRadius.circular(20)),
        child: const Text("ON TIME", style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
      )),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: Colors.orange.withOpacity(0.8), borderRadius: BorderRadius.circular(20)),
        child: const Text("NOT RETURNED AT", style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
      )),
    ]);
  }
}
