import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyLendingBooksPage extends StatefulWidget {
  const MyLendingBooksPage({super.key});

  @override
  State<MyLendingBooksPage> createState() => _MyLendingBooksPageState();
}

class _MyLendingBooksPageState extends State<MyLendingBooksPage> {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  Future<void> pickDate(TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormat("dd-MM-yyyy").format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B102A),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: const Color(0xFF3E466A),
          elevation: 0,
          title: const Row(
            children: [
              Icon(Icons.menu_book_outlined, size: 28),
              SizedBox(width: 10),
              Text(
                "My Lending Books",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// ================= FILTER CARD =================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3E466A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildLabel("Book Title"),
                  buildTextField("e.g. Math, Physics"),

                  buildLabel("Due Date From"),
                  buildDateField(fromDateController),

                  buildLabel("Due Date To"),
                  buildDateField(toDateController),

                  const SizedBox(height: 20),

                  /// Apply Reset
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4361EE),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: const Text("APPLY"),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5E6A75),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: const Text("RESET"),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Export Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildIconButton(Icons.copy, Colors.blue),
                      buildIconButton(Icons.file_open, Colors.teal),
                      buildIconButton(Icons.table_chart, Colors.green),
                      buildIconButton(Icons.picture_as_pdf, Colors.red),
                      buildIconButton(Icons.print, Colors.black),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// ================= SHOW ENTRIES =================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3E466A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Show Entries",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  const SizedBox(height: 15),

                  buildTextField("search"),

                  const SizedBox(height: 20),

                  /// Horizontal Scroll Table
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor:
                      MaterialStateProperty.all(const Color(0xFF4B557D)),
                      columns: const [
                        DataColumn(label: Text("#")),
                        DataColumn(label: Text("Issue No.")),
                        DataColumn(label: Text("Book ID")),
                        DataColumn(label: Text("Book Title")),
                        DataColumn(label: Text("Issued At")),
                        DataColumn(label: Text("Due Date")),
                        DataColumn(label: Text("Days Overdue")),
                        DataColumn(label: Text("Return At")),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text("1")),
                          const DataCell(Text("2")),
                          const DataCell(Text("4")),
                          const DataCell(
                              Text("Advanced Taxation Concepts")),
                          const DataCell(Text("30 Oct 2025")),
                          const DataCell(Text("15 Nov 2025")),
                          DataCell(Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF5E6A75),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Text("-79 days"),
                          )),
                          const DataCell(Text("09 Nov 2025")),
                        ]),
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

  /// ================= COMMON WIDGETS =================

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }

  Widget buildTextField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF5E6A75),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget buildDateField(TextEditingController controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => pickDate(controller),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "dd-mm-yyyy",
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF5E6A75),
        suffixIcon: const Icon(Icons.calendar_today, color: Colors.white70),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget buildIconButton(IconData icon, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, color: borderColor),
        onPressed: () {},
      ),
    );
  }
}
