import 'package:flutter/material.dart';

class AttendanceReportPage extends StatefulWidget {
  const AttendanceReportPage({super.key});

  @override
  State<AttendanceReportPage> createState() => _AttendanceReportPageState();
}

class _AttendanceReportPageState extends State<AttendanceReportPage> {

  bool businessOpen = false;
  bool costOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1230),

      appBar: AppBar(
        backgroundColor: const Color(0xff0a1230),
        elevation: 0,
        title: const Text(
          "Attendance Report",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Nisha Rao",
                style: TextStyle(color: Colors.white, fontSize: 20)),

            const SizedBox(height: 4),

            const Text("Roll No. 25IIAS2UG103",
                style: TextStyle(color: Colors.white70)),

            const SizedBox(height: 4),

            const Text("Class: Cost Analysis and Management - A",
                style: TextStyle(color: Colors.white70)),

            const SizedBox(height: 20),

            /// TOTAL CLASS DAYS
            statsCard(
              Icons.calendar_month,
              "4",
              "Total Class Days",
            ),

            const SizedBox(height: 15),

            /// DAYS PRESENT
            statsCard(
              Icons.person,
              "3",
              "Days Present",
            ),

            const SizedBox(height: 15),

            /// PERCENTAGE
            statsCard(
              Icons.show_chart,
              "66.67%",
              "Attendance Percentage",
            ),

            const SizedBox(height: 25),

            const Text(
              "Attendance Records",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              "Detailed attendance log, grouped by subject.",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 20),

            /// SUBJECT 1
            subjectCard(
              "Business cost control",
              "0% Attendance (0/1)",
              businessOpen,
                  () {
                setState(() {
                  businessOpen = !businessOpen;
                });
              },
              [
                attendanceRow("1", "04 Dec 2025", "15:00 - 16:00", "Leave")
              ],
            ),

            const SizedBox(height: 15),

            /// SUBJECT 2
            subjectCard(
              "Cost Accounting Methods",
              "100% Attendance (2/2)",
              costOpen,
                  () {
                setState(() {
                  costOpen = !costOpen;
                });
              },
              [
                attendanceRow("1", "03 Dec 2025", "15:00 - 16:00", "Present"),
                attendanceRow("2", "22 Oct 2025", "10:00 - 12:00", "Present"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// STATS CARD
  Widget statsCard(IconData icon, String value, String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xff3c4566),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 40),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
  }

  /// SUBJECT CARD
  Widget subjectCard(
      String subject,
      String percent,
      bool open,
      VoidCallback onTap,
      List<DataRow> rows) {

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3c4566),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [

          /// HEADER
          ListTile(
            title: Text(subject,
                style: const TextStyle(color: Colors.white)),
            subtitle: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(percent,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            trailing: Icon(
              open ? Icons.expand_less : Icons.expand_more,
              color: Colors.white,
            ),
            onTap: onTap,
          ),

          /// TABLE
          if (open)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("#", style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text("Date", style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text("Timing", style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text("Status", style: TextStyle(color: Colors.white))),
                  DataColumn(label: Text("Remarks", style: TextStyle(color: Colors.white))),
                ],
                rows: rows,
              ),
            )
        ],
      ),
    );
  }

  /// ATTENDANCE ROW
  DataRow attendanceRow(
      String no, String date, String time, String status) {

    return DataRow(cells: [

      DataCell(Text(no, style: const TextStyle(color: Colors.white))),

      DataCell(Text(date, style: const TextStyle(color: Colors.white))),

      DataCell(Text(time, style: const TextStyle(color: Colors.white))),

      DataCell(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: status == "Present" ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(status,
              style: const TextStyle(color: Colors.white)),
        ),
      ),

      const DataCell(Text("-", style: TextStyle(color: Colors.white))),
    ]);
  }
}
