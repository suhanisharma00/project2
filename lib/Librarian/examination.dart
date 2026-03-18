import 'package:flutter/material.dart';
import 'exam_schedule_management.dart';

class ExaminationListPage extends StatefulWidget {
  const ExaminationListPage({super.key});

  @override
  State<ExaminationListPage> createState() => _ExaminationListPageState();
}

class _ExaminationListPageState extends State<ExaminationListPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color accentBlue = Color(0xFF4A89FF);

  String selectedEntries = "10";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text("Exam List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// ALL AVAILABLE EXAMS CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("All Available Exams",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 20),
                  
                  /// EXPORT BUTTONS
                  Row(
                    children: [
                      exportIcon(Icons.description, Colors.teal), // CSV
                      exportIcon(Icons.table_chart, Colors.green), // Excel
                      exportIcon(Icons.picture_as_pdf, Colors.red), // PDF
                      exportIcon(Icons.print, Colors.blue), // Print
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// SHOW ENTRIES
                  Row(
                    children: [
                      const Text("Show ", style: TextStyle(color: Colors.white70, fontSize: 13)),
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
                      const Text(" entries", style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 12),

                  /// SEARCH BAR
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Search Remarks",
                      hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
                      filled: true,
                      fillColor: fieldColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// EXAM EXPANDABLE ITEMS
            examExpandableItem(
              "Mid Term Examination 2025",
              "Written",
              "FAB101",
              "Introduction to fundamental accounting principles",
              "01 Oct 2025",
              "30 Dec 2025",
            ),
            
            const SizedBox(height: 12),

            examExpandableItem(
              "Mid Term Examination II 2025",
              "Written",
              "CAM204",
              "Advanced cost accounting methods and analysis",
              "15 Oct 2025",
              "15 Jan 2026",
            ),
          ],
        ),
      ),
    );
  }

  Widget exportIcon(IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget examExpandableItem(String title, String type, String code, String desc, String start, String end) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          iconColor: Colors.white54,
          collapsedIconColor: Colors.white54,
          title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF242F4D),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        headerText("#", 30),
                        headerText("Type", 100),
                        headerText("Code", 80),
                        headerText("Description", 200),
                        headerText("Start Date", 100),
                        headerText("End Date", 100),
                        headerText("Action", 120),
                      ],
                    ),
                    const Divider(color: Colors.white10),
                    const SizedBox(height: 10),
                    
                    Row(
                      children: [
                        const cellText("1", 30),
                        SizedBox(
                          width: 100,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                            child: const Text(
                              "Written", 
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(4)),
                            child: const Text(
                              "FAB101", 
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 11)
                            ),
                          ),
                        ),
                        cellText(desc, 200),
                        cellText(start, 100),
                        cellText(end, 100),
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ExamScheduleManagementPage(examTitle: title),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade700,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                            child: const Text("Check/Add\nSchedule", 
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 10)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class headerText extends StatelessWidget {
  final String text;
  final double width;
  const headerText(this.text, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }
}

class cellText extends StatelessWidget {
  final String text;
  final double width;
  const cellText(this.text, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ),
    );
  }
}
