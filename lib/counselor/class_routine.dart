import 'package:flutter/material.dart';

class ClassesDetailsPage extends StatelessWidget {
  const ClassesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        elevation: 0,
        title: const Text(
          "Classes Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // ✅ Horizontal Slide
        child: SingleChildScrollView(
          child: DataTable(
            headingRowColor:
            MaterialStateProperty.all(const Color(0xFF3B4668)),
            dataRowColor:
            MaterialStateProperty.all(const Color(0xFF3B4668)),
            columnSpacing: 40,
            columns: const [
              DataColumn(
                  label: Text("#",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Class Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Code",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Description",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Level",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text("Sections",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text("1",
                    style: TextStyle(color: Colors.white))),
                const DataCell(Text(
                  "Financial Accounting Basics",
                  style: TextStyle(color: Colors.white),
                )),
                DataCell(Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5E6A75),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("FAB101",
                      style: TextStyle(color: Colors.white)),
                )),
                const DataCell(Text(
                  "Introduction to fundamental accounting principles,...",
                  style: TextStyle(color: Colors.white),
                )),
                DataCell(Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5E6A75),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("Graduation",
                      style: TextStyle(color: Colors.white)),
                )),
                DataCell(ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E6A75),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.list, size: 16),
                  label: const Text("VIEW"),
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text("2",
                    style: TextStyle(color: Colors.white))),
                const DataCell(Text(
                  "Cost Analysis and Management",
                  style: TextStyle(color: Colors.white),
                )),
                DataCell(Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5E6A75),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("CAM204",
                      style: TextStyle(color: Colors.white)),
                )),
                const DataCell(Text(
                  "Study of methods for analyzing, controlling, and m...",
                  style: TextStyle(color: Colors.white),
                )),
                DataCell(Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5E6A75),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("Graduation",
                      style: TextStyle(color: Colors.white)),
                )),
                DataCell(ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E6A75),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.list, size: 16),
                  label: const Text("VIEW"),
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
