import 'package:flutter/material.dart';
import 'Issue_History.dart';
import 'Edit_Issue.dart';
import 'issue_Book.dart';

class IssuedBooksListPage extends StatefulWidget {
  const IssuedBooksListPage({super.key});

  @override
  State<IssuedBooksListPage> createState() => _IssuedBooksListPageState();
}

class _IssuedBooksListPageState extends State<IssuedBooksListPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);
  static const Color greyBtn = Color(0xFF475569);

  String selectedReturned = "All";
  String selectedEntries = "10";

  final TextEditingController _issuedFromController = TextEditingController();
  final TextEditingController _issuedToController = TextEditingController();
  final TextEditingController _dueFromController = TextEditingController();
  final TextEditingController _dueToController = TextEditingController();

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
        title: const Text("Issued Books",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const IssueBookPage()),
                  );
                },
                icon: const Icon(Icons.add, size: 16, color: Colors.white),
                label: const Text("Issue New Book", style: TextStyle(color: Colors.white, fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.white24),
                  ),
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
                  const Center(
                    child: Text("Filter Issued Books",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  const SizedBox(height: 20),
                  buildInputField("Book Title", "Enter Book"),
                  buildInputField("User Name", "Enter User"),
                  buildDateField("Issued From", _issuedFromController),
                  buildDateField("Issued To", _issuedToController),
                  buildDateField("Due From", _dueFromController),
                  buildDateField("Due To", _dueToController),
                  buildDropdownField("Returned?", selectedReturned, ["All", "Yes", "No"], (val) {
                    setState(() => selectedReturned = val!);
                  }),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueBtn,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          child: const Text("APPLY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _issuedFromController.clear();
                              _issuedToController.clear();
                              _dueFromController.clear();
                              _dueToController.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greyBtn,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          child: const Text("RESET", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  )
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
                  const Text("Issued Book Records",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  const Text("A detailed list of all books issued to users.",
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Show Entries", style: TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(4)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedEntries,
                            dropdownColor: fieldColor,
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white54, size: 16),
                            items: ["10", "25", "50", "100"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                            onChanged: (val) => setState(() => selectedEntries = val!),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "search",
                      hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
                      filled: true,
                      fillColor: fieldColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      exportIcon(Icons.copy, Colors.blue),
                      exportIcon(Icons.description, Colors.teal),
                      exportIcon(Icons.table_chart, Colors.green),
                      exportIcon(Icons.picture_as_pdf, Colors.red),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// DATA TABLE WITH HORIZONTAL SLIDER
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(const Color(0xFF2D3748)),
                      columnSpacing: 20,
                      columns: const [
                        DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Book\nIssue Id", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Book Title", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Lender", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Issued At", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Due Date", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Returned At", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Actions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Return/Delete", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        buildDataRow("1", "7", "Principles of\nFinancial\nAccounting", "Rajiv\nMenon (Sta\nff)", "17 Nov 2025", "17 Dec 2025"),
                        buildDataRow("2", "6", "Introduct\nion to\nManagerial\nAccounting", "Rohit\nKumar (Ac\ncountants", "13 Nov 2025", "09 Dec 2025"),
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

  Widget buildInputField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          TextField(
            style: const TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
              filled: true,
              fillColor: fieldColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          InkWell(
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
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(6)),
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

  Widget exportIcon(IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(4), border: Border.all(color: color.withOpacity(0.5))),
      child: Icon(icon, color: color, size: 18),
    );
  }

  DataRow buildDataRow(String hash, String issueId, String title, String lender, String issuedAt, String dueDate) {
    return DataRow(cells: [
      DataCell(Text(hash, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(issueId, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(title, style: const TextStyle(color: Colors.white, fontSize: 12))),
      DataCell(Text(lender, style: const TextStyle(color: Colors.white70, fontSize: 11))),
      DataCell(Text(issuedAt, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(dueDate, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: Colors.orange.withOpacity(0.8), borderRadius: BorderRadius.circular(4)),
        child: const Text("Not Returned", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      )),
      DataCell(Row(
        children: [
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => IssueHistoryPage(issueId: issueId))),
            child: Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.cyan.withOpacity(0.3), borderRadius: BorderRadius.circular(4)), child: const Icon(Icons.visibility, color: Colors.cyan, size: 14)),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditIssuePage(issueId: issueId))),
            child: Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.orange.withOpacity(0.3), borderRadius: BorderRadius.circular(4)), child: const Icon(Icons.edit, color: Colors.orange, size: 14)),
          ),
        ],
      )),
      DataCell(Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.green.withOpacity(0.3), borderRadius: BorderRadius.circular(4)), child: const Icon(Icons.refresh, color: Colors.green, size: 14))),
    ]);
  }
}
