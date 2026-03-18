import 'package:flutter/material.dart';

class ExamScheduleManagementPage extends StatefulWidget {
  final String examTitle;
  const ExamScheduleManagementPage({super.key, required this.examTitle});

  @override
  State<ExamScheduleManagementPage> createState() => _ExamScheduleManagementPageState();
}

class _ExamScheduleManagementPageState extends State<ExamScheduleManagementPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);

  late String selectedExam;

  @override
  void initState() {
    super.initState();
    selectedExam = widget.examTitle;
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
        title: const Text("Exam Schedule Management",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// EXAM SELECTION CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select Exam",
                      style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  buildDropdownField(selectedExam, ["Mid Term Examination 2025", "Mid Term Examination II 2025"], (val) {
                    setState(() => selectedExam = val!);
                  }),
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
                  Row(
                    children: [
                      exportIcon(Icons.description, Colors.teal),
                      exportIcon(Icons.table_chart, Colors.green),
                      exportIcon(Icons.picture_as_pdf, Colors.red),
                      const Spacer(),
                      Expanded(
                        child: Container(
                          height: 38,
                          decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(6)),
                          child: const TextField(
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            decoration: InputDecoration(
                              hintText: "Search...",
                              hintStyle: TextStyle(color: Colors.white24),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search, color: Colors.white24, size: 18),
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// DATA TABLE WITH HORIZONTAL SLIDER
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(const Color(0xFF2D3748)),
                      columnSpacing: 25,
                      columns: const [
                        DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Subject", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Date", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Room", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Action", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        buildDataRow("1", "Principles of\nAccounting", "15 Dec 2025", "10:00 AM", "Hall A", "Already Registered", true),
                        buildDataRow("2", "Financial\nStatements", "16 Dec 2025", "10:00 AM", "Hall B", "Not Registered", false),
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

  Widget buildDropdownField(String value, List<String> items, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(8)),
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

  DataRow buildDataRow(String hash, String subject, String date, String time, String room, String status, bool isRegistered) {
    return DataRow(cells: [
      DataCell(Text(hash, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(subject, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
      DataCell(Text(date, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(time, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Text(room, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isRegistered ? Colors.blue.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: isRegistered ? Colors.blue : Colors.orange),
        ),
        child: Text(status, style: TextStyle(color: isRegistered ? Colors.blue : Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
      )),
      DataCell(
        ElevatedButton(
          onPressed: isRegistered ? null : () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: isRegistered ? Colors.grey.shade800 : Colors.green.shade700,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            minimumSize: const Size(0, 30),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: Text(isRegistered ? "Already Registered" : "Register Now",
              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ),
      ),
    ]);
  }
}
