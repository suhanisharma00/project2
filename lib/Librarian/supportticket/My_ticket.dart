import 'package:flutter/material.dart';
import 'create_ticket.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({super.key});

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);

  String selectedPriority = "All Priorities";
  String selectedStatus = "All Statuses";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.gps_fixed, color: Colors.white, size: 20),
        title: const Text("Your Support Tickets",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                      children: [
                        buildSearchField(),
                        const SizedBox(height: 12),
                        buildDropdown(selectedPriority, ["All Priorities", "Low", "Medium", "High"], (val) {
                          setState(() => selectedPriority = val!);
                        }),
                        const SizedBox(height: 12),
                        buildDropdown(selectedStatus, ["All Statuses", "Open", "Closed", "Pending"], (val) {
                          setState(() => selectedStatus = val!);
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DATA TABLE SECTION
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(const Color(0xFF2D3748)),
                        columnSpacing: 25,
                        columns: const [
                          DataColumn(label: Text("#ID", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Title", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Priority", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Category", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Assigned To", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Created At", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text("Action", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          buildDataRow("10", "giytug", "Low", "Open", "-", "Unassigned", "30 Oct, 2025"),
                          buildDataRow("7", "Classroom\nTechnology\nMalfunction", "Low", "Open", "Technical\nIssue", "Rajveer K.\nMalhotra", "09 Oct, 2025"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// BOTTOM BUTTON
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateTicketPage()),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text("CREATE NEW TICKET", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueBtn,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchField() {
    return Container(
      height: 45,
      decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(8)),
      child: const TextField(
        style: TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: "Search by Title...",
          hintStyle: TextStyle(color: Colors.white38, fontSize: 14),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget buildDropdown(String value, List<String> items, Function(String?) onChanged) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16),
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

  DataRow buildDataRow(String id, String title, String priority, String status, String category, String assigned, String date) {
    return DataRow(cells: [
      DataCell(Text(id, style: const TextStyle(color: Colors.white70))),
      DataCell(Text(title, style: const TextStyle(color: Colors.white, fontSize: 13))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20)),
        child: Text(priority, style: const TextStyle(color: Colors.white70, fontSize: 11)),
      )),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20)),
        child: Text(status, style: const TextStyle(color: Colors.white70, fontSize: 11)),
      )),
      DataCell(Text(category, style: const TextStyle(color: Colors.white70))),
      DataCell(Text(assigned, style: const TextStyle(color: Colors.white70))),
      DataCell(Text(date, style: const TextStyle(color: Colors.white70))),
      DataCell(ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white12,
          minimumSize: const Size(60, 30),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: const Text("VIEW", style: TextStyle(color: Colors.white, fontSize: 10)),
      )),
    ]);
  }
}
