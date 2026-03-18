import 'package:flutter/material.dart';

class OverdueBooksPage extends StatefulWidget {
  const OverdueBooksPage({super.key});

  @override
  State<OverdueBooksPage> createState() => _OverdueBooksPageState();
}

class _OverdueBooksPageState extends State<OverdueBooksPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);
  static const Color greyBtn = Color(0xFFB0BEC5);

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
        leading: const Icon(Icons.info, color: Color(0xFFE11D48)),
        title: const Text("Overdue Books",
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
                      Text("Filter Overdue Books",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildLabel("Book Title"),
                  buildInputField("e.g Math, Physics"),
                  buildLabel("User Name"),
                  buildInputField("e.g John, Ayesha"),
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
                        backgroundColor: greyBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// OVERDUE RECORDS SECTION
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
                      Text("Overdue Records",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 34.0),
                    child: Text("A list of all books that are past their due date.",
                        style: TextStyle(color: Colors.white54, fontSize: 12)),
                  ),
                  const SizedBox(height: 20),
                  const Text("Show 10 entries", style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 12),
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Search books...",
                      hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
                      filled: true,
                      fillColor: fieldColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                    ),
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
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.print, size: 16, color: Colors.white60),
                      label: const Text("PRINT", style: TextStyle(color: Colors.white60)),
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
                      columnSpacing: 30,
                      columns: const [
                        DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontSize: 12))),
                        DataColumn(label: Text("ISSUE ID", style: TextStyle(color: Colors.white, fontSize: 12))),
                        DataColumn(label: Text("BOOK TITLE", style: TextStyle(color: Colors.white, fontSize: 12))),
                        DataColumn(label: Text("LENDER", style: TextStyle(color: Colors.white, fontSize: 12))),
                        DataColumn(label: Text("Issued At", style: TextStyle(color: Colors.white, fontSize: 12))),
                        DataColumn(label: Text("Due Date", style: TextStyle(color: Colors.white, fontSize: 12))),
                        DataColumn(label: Text("Days Overdue", style: TextStyle(color: Colors.white, fontSize: 12))),
                        DataColumn(label: Text("Action", style: TextStyle(color: Colors.white, fontSize: 12))),
                      ],
                      rows: [
                        buildDataRow("1", "3", "Principles of\nFinancial\nAccounting", "Aarav\nMehta\n(Students)", "30 Oct 2025", "15 Nov 2025", "12 days"),
                        buildDataRow("2", "4", "Advanced\nTaxation\nConcepts", "Neelam\nKapoor\n(Librarian)", "09 Nov 2025", "30 Nov 2025", "10 days"),
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

  DataRow buildDataRow(String hash, String issueId, String title, String lender, String issuedAt, String dueDate, String overdueDays) {
    return DataRow(cells: [
      DataCell(Text(hash, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(issueId, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(title, style: const TextStyle(color: Colors.white, fontSize: 12))),
      DataCell(Text(lender, style: const TextStyle(color: Colors.white70, fontSize: 11))),
      DataCell(Text(issuedAt, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(dueDate, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: const Color(0xFFE11D48).withOpacity(0.8), borderRadius: BorderRadius.circular(4)),
        child: Text(overdueDays, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      )),
      DataCell(Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
        child: const Icon(Icons.refresh, color: Colors.green, size: 16),
      )),
    ]);
  }
}
