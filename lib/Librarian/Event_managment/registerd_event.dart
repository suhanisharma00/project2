import 'package:flutter/material.dart';

class MyRegisteredEventsPage extends StatefulWidget {
  const MyRegisteredEventsPage({super.key});

  @override
  State<MyRegisteredEventsPage> createState() => _MyRegisteredEventsPageState();
}

class _MyRegisteredEventsPageState extends State<MyRegisteredEventsPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);

  String selectedStatus = "All";
  String selectedType = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.event_note, color: Colors.white, size: 24),
        title: const Text("My Registered Events",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
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
                      Icon(Icons.filter_alt, color: Colors.white70, size: 18),
                      SizedBox(width: 8),
                      Text("Filter Events",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildLabel("Status"),
                  buildDropdownField(selectedStatus, ["All", "Upcoming", "Completed"], (val) {
                    setState(() => selectedStatus = val!);
                  }),
                  const SizedBox(height: 12),
                  buildLabel("Type"),
                  buildDropdownField(selectedType, ["All", "Free", "Paid"], (val) {
                    setState(() => selectedType = val!);
                  }),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedStatus = "All";
                          selectedType = "All";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("RESET", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// DATA TABLE SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                    DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Image", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Title", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Date & Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Venue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Ticket Info", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Registration on", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Action", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    buildDataRow(
                      "1",
                      "Campus Cultural Fest\n2025",
                      "A vibrant celebration\nshowcasing the diverse\ncultu...",
                      "03 Jan 2026\n09:00 AM -\n04:00 PM",
                      "Seminar Hall",
                      "Free Event",
                      "09 Oct 2025\n12:16 PM",
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

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
    );
  }

  Widget buildDropdownField(String value, List<String> items, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(8),
      ),
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

  DataRow buildDataRow(String hash, String title, String desc, String dateTime, String venue, String ticketStatus, String regDate) {
    return DataRow(cells: [
      DataCell(Text(hash, style: const TextStyle(color: Colors.white70, fontSize: 12))),
      const DataCell(Text("Img", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 12))),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          Text(desc, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      )),
      DataCell(Text(dateTime, style: const TextStyle(color: Colors.white70, fontSize: 11))),
      DataCell(Text(venue, style: const TextStyle(color: Colors.white70, fontSize: 11))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(4)),
        child: Text(ticketStatus, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      )),
      DataCell(Text(regDate, style: const TextStyle(color: Colors.white70, fontSize: 11))),
      DataCell(ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF374151),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minimumSize: const Size(0, 30),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: const Text("CANCEL\nREGISTRATION", 
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 9)),
      )),
    ]);
  }
}
