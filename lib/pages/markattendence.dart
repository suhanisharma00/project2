import 'package:flutter/material.dart';

class MarkAttendancePage extends StatefulWidget {
  const MarkAttendancePage({super.key});

  @override
  State<MarkAttendancePage> createState() => _MarkAttendancePageState();
}

class _MarkAttendancePageState extends State<MarkAttendancePage> {
  final List<Map<String, dynamic>> students = [
    {
      "name": "Aarav Mehta",
      "roll": "25IIAS2UG102",
      "status": "Present",
      "remark": ""
    },
    {
      "name": "Anurag Singh",
      "roll": "25IIAS010",
      "status": "Present",
      "remark": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        elevation: 0,
        title: const Text("Mark Attendance"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Mark Attendance for Financial Accounting Basics - A\n(Principles of Accounting)",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 6),
                  Text(
                    "Date: 06 Feb 2026",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// TABLE HEADER
            rowHeader(),

            const SizedBox(height: 8),

            /// STUDENT LIST
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return studentRow(index);
                },
              ),
            ),

            /// SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E40AF),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("SUBMIT ATTENDANCE"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rowHeader() {
    return Row(
      children: const [
        SizedBox(width: 30, child: Text("#", style: TextStyle(color: Colors.grey))),
        Expanded(child: Text("Name", style: TextStyle(color: Colors.grey))),
        Expanded(child: Text("Roll No", style: TextStyle(color: Colors.grey))),
        Expanded(child: Text("Status", style: TextStyle(color: Colors.grey))),
        Expanded(child: Text("Remarks", style: TextStyle(color: Colors.grey))),
      ],
    );
  }



  Widget studentRow(int index) {
    final student = students[index];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text("${index + 1}",
                style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text(student["name"],
                style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Text(student["roll"],
                style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Column(
              children: ["Present", "Absent", "Leave"].map((status) {
                return RadioListTile(
                  value: status,
                  groupValue: student["status"],
                  dense: true,
                  activeColor: Colors.white,
                  title: Text(status,
                      style:
                      const TextStyle(color: Colors.white, fontSize: 12)),
                  onChanged: (value) {
                    setState(() {
                      student["status"] = value;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Any Remarks",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF334155),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                student["remark"] = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
