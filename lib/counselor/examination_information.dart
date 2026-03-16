import 'package:flutter/material.dart';

class ExamListPage extends StatelessWidget {
  const ExamListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1230),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3E4468),
        title: const Row(
          children: [
            Icon(Icons.description_outlined),
            SizedBox(width: 10),
            Text("Exam List"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 SEARCH CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3E4468),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search Exams",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle:
                      const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey.shade600,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔥 TABLE SECTION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3E4468),
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor:
                  MaterialStateProperty.all(Colors.black26),
                  columns: const [
                    DataColumn(label: Text("#")),
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Type")),
                    DataColumn(label: Text("Code")),
                    DataColumn(label: Text("Start Date")),
                    DataColumn(label: Text("End Date")),
                    DataColumn(label: Text("Description")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text("1")),
                      const DataCell(
                          Text("Mid Term Examination 2025")),
                      DataCell(Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "WRITTEN",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      const DataCell(Text("EXAM001")),
                      const DataCell(Text("01 Oct 2025")),
                      const DataCell(Text("30 Dec 2025")),
                      const DataCell(Text("-")),
                      DataCell(ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                        child: const Text("SCHEDULE"),
                      )),
                    ]),

                    DataRow(cells: [
                      const DataCell(Text("2")),
                      const DataCell(
                          Text("Mid Term Examination II 2025")),
                      DataCell(Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "WRITTEN",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                      const DataCell(Text("semester002")),
                      const DataCell(Text("31 Oct 2025")),
                      const DataCell(Text("30 Nov 2025")),
                      const DataCell(Text("-")),
                      DataCell(ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                        child: const Text("SCHEDULE"),
                      )),
                    ]),
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
