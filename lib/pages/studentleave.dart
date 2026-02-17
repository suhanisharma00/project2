import 'package:flutter/material.dart';

void main() {
  runApp(const leave());
}

class leave extends StatelessWidget {
  const leave({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentLeaveScreen(),
    );
  }
}

class StudentLeaveScreen extends StatelessWidget {
  const StudentLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1230),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3E4468),
        title: const Row(
          children: [
            Icon(Icons.calendar_month),
            SizedBox(width: 10),
            Text("Student Leave Applications"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 FILTER CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3E4468),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("Search"),
                  buildTextField("Student Roll no."),
                  const SizedBox(height: 15),

                  buildLabel("Applied Date"),
                  buildTextField("dd-mm-yyyy"),
                  const SizedBox(height: 15),

                  buildLabel("Status"),
                  buildDropdown(),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.all(14),
                          ),
                          onPressed: () {},
                          child: const Text("APPLY"),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.all(14),
                          ),
                          onPressed: () {},
                          child: const Text("RESET"),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 🔹 EXPORT ICON BUTTONS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.copy, color: Colors.white),
                      Icon(Icons.table_chart, color: Colors.white),
                      Icon(Icons.grid_on, color: Colors.white),
                      Icon(Icons.picture_as_pdf, color: Colors.red),
                      Icon(Icons.print, color: Colors.white),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔹 TABLE SECTION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3E4468),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Show Entries",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  buildTextField("search"),
                  const SizedBox(height: 20),

                  // 🔥 Horizontal Scroll Table
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor:
                      MaterialStateProperty.all(Colors.black26),
                      columns: const [
                        DataColumn(label: Text("#")),
                        DataColumn(label: Text("Applied by")),
                        DataColumn(label: Text("Class/Section")),
                        DataColumn(label: Text("Roll no.")),
                        DataColumn(label: Text("Leave Type")),
                        DataColumn(label: Text("Duration")),
                        DataColumn(label: Text("Reason")),
                        DataColumn(label: Text("Status")),
                        DataColumn(label: Text("Remarks")),
                        DataColumn(label: Text("Applied At")),
                        DataColumn(label: Text("Action")),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text("1")),
                          const DataCell(Text("Arnav Mehta")),
                          const DataCell(
                              Text("Financial Accounting Basics - A")),
                          const DataCell(Text("25IIAS2")),
                          const DataCell(Text("Casual")),
                          const DataCell(
                              Text("05 Nov 2025 - 07 Nov 2025")),
                          const DataCell(Text("I Have a Plan")),
                          DataCell(Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text("Pending"),
                          )),
                          const DataCell(Text("-")),
                          const DataCell(
                              Text("30 Oct 2025, 05:27 AM")),
                          DataCell(IconButton(
                            icon: const Icon(Icons.edit,
                                color: Colors.blue),
                            onPressed: () {},
                          )),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Widgets

  static Widget buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  static Widget buildTextField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.grey.shade600,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static Widget buildDropdown() {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFF3E4468),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade600,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      items: const [
        DropdownMenuItem(value: "All", child: Text("All Status")),
        DropdownMenuItem(value: "Pending", child: Text("Pending")),
        DropdownMenuItem(value: "Approved", child: Text("Approved")),
      ],
      onChanged: (value) {},
    );
  }
}
