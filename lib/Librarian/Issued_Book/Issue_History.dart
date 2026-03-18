import 'package:flutter/material.dart';

class IssueHistoryPage extends StatefulWidget {
  final String issueId;
  const IssueHistoryPage({super.key, required this.issueId});

  @override
  State<IssueHistoryPage> createState() => _IssueHistoryPageState();
}

class _IssueHistoryPageState extends State<IssueHistoryPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);
  static const Color greyBtn = Color(0xFF475569);

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Issue History (ID: ${widget.issueId})",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
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
                      Icon(Icons.filter_alt, color: blueBtn, size: 20),
                      SizedBox(width: 8),
                      Text("Filter History Logs",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildDateField("Action From", _fromController),
                  buildDateField("Action To", _toController),
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
                              _fromController.clear();
                              _toController.clear();
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
                  const Text("History Records",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  const Text("Logs of all actions performed on this book issue.",
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "search logs...",
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

                  /// DATA TABLE
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all(const Color(0xFF2D3748)),
                      columnSpacing: 25,
                      columns: const [
                        DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Action", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Performed By", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Date & Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Notes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        buildDataRow("1", "Updated Due Date", "Librarian", "18 Nov 2025, 10:30 AM", "Extended by 7 days"),
                        buildDataRow("2", "Book Issued", "Staff", "17 Nov 2025, 09:00 AM", "Initial issue"),
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

  Widget exportIcon(IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(4), border: Border.all(color: color.withOpacity(0.5))),
      child: Icon(icon, color: color, size: 18),
    );
  }

  DataRow buildDataRow(String hash, String action, String user, String dateTime, String notes) {
    return DataRow(cells: [
      DataCell(Text(hash, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(action, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
      DataCell(Text(user, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(dateTime, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(notes, style: const TextStyle(color: Colors.white70, fontSize: 12))),
    ]);
  }
}
