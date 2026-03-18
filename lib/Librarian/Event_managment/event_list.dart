import 'package:flutter/material.dart';

class ExploreEventsPage extends StatefulWidget {
  const ExploreEventsPage({super.key});

  @override
  State<ExploreEventsPage> createState() => _ExploreEventsPageState();
}

class _ExploreEventsPageState extends State<ExploreEventsPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);
  static const Color greyBtn = Color(0xFF475569);

  String selectedStatus = "All Events";
  String selectedType = "All types";
  String selectedEntries = "10";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text("Explore Events",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
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
                  buildLabel("Filter by Status"),
                  buildDropdownField(selectedStatus, ["All Events", "Upcoming", "Ended"], (val) {
                    setState(() => selectedStatus = val!);
                  }),
                  const SizedBox(height: 12),
                  buildLabel("Filter by Type"),
                  buildDropdownField(selectedType, ["All types", "Ticketed", "Free"], (val) {
                    setState(() => selectedType = val!);
                  }),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("APPLY FILTERS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greyBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("RESET FILTERS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ALL EVENTS LIST SECTION
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const Text("All Events",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text("show entries ", style: TextStyle(color: Colors.white70, fontSize: 13)),
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
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text("Search ", style: TextStyle(color: Colors.white70, fontSize: 13)),
                      Expanded(
                        child: Container(
                          height: 34,
                          decoration: BoxDecoration(color: fieldColor, borderRadius: BorderRadius.circular(4)),
                          child: const TextField(
                            style: TextStyle(color: Colors.white, fontSize: 13),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                      headingRowColor: MaterialStateProperty.all(const Color(0xFF2D3748)),
                      columnSpacing: 25,
                      columns: const [
                        DataColumn(label: Text("#", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Image", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Event Details", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Date & Time", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Venue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Ticket info", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        DataColumn(label: Text("Action", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        buildDataRow(
                          "1",
                          "Annual Financial Literacy\nWorkshop 2025",
                          "A comprehensive workshop aimed\nat enhancin",
                          "12 Dec 2025\n09:00 AM - 12:00 PM",
                          "Seminar Hall",
                          "Price: ₹499.99\nSeats Left: 99",
                          "Ticketed",
                          true,
                        ),
                        buildDataRow(
                          "2",
                          "Hype Series",
                          "This is event",
                          "12 Dec 2025\n10:00 AM - 01:00 PM",
                          "ACIC VGU",
                          "Seats Left: 65",
                          "free Event",
                          false,
                        ),
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

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
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

  Widget exportIcon(IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  DataRow buildDataRow(String hash, String title, String desc, String dateTime, String venue, String ticketPrice, String ticketStatus, bool isTicketed) {
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
      DataCell(Row(
        children: [
          const Icon(Icons.location_on, color: Colors.white54, size: 14),
          const SizedBox(width: 4),
          Text(venue, style: const TextStyle(color: Colors.white70, fontSize: 11)),
        ],
      )),
      DataCell(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(ticketPrice, style: const TextStyle(color: Colors.white70, fontSize: 11)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.8), borderRadius: BorderRadius.circular(4)),
            child: Text(ticketStatus, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
          ),
        ],
      )),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: Colors.red.shade800, borderRadius: BorderRadius.circular(4)),
        child: const Text("Event Ended", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      )),
    ]);
  }
}
