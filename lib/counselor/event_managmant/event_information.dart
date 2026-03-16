import 'package:flutter/material.dart';

class ExploreEventsPage extends StatefulWidget {
  const ExploreEventsPage({super.key});

  @override
  State<ExploreEventsPage> createState() => _ManageEventsPageState();
}

class _ManageEventsPageState extends State<ExploreEventsPage> {

  String? status;
  String? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3A59),
        elevation: 0,
        title: const Text("Manage Events",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// FILTER CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF3B4668),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [

                  buildDropdown("Filter by Status", "All Events",
                      ["All Events", "Upcoming", "Completed"], (val) {
                        setState(() => status = val);
                      }),

                  const SizedBox(height: 20),

                  buildDropdown("Filter by Category", "All Categories",
                      ["All Categories", "Paid", "Free"], (val) {
                        setState(() => type = val);
                      }),

                  const SizedBox(height: 25),

                  /// APPLY BUTTON (same size)
                  buildMainButton("APPLY FILTERS",
                      const Color(0xFF3D63A8), () {}),

                  const SizedBox(height: 15),

                  /// RESET BUTTON (same size)
                  buildMainButton("RESET FILTERS",
                      const Color(0xFF5E6A75), () {}),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// EXPORT ICON ROW (same size icons)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF3B4668),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  exportButton(Icons.file_copy, Colors.blue),
                  exportButton(Icons.table_chart, Colors.green),
                  exportButton(Icons.picture_as_pdf, Colors.red),
                  exportButton(Icons.print, Colors.indigo),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// SLIDE TABLE
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(
                    const Color(0xFF3B4668)),
                dataRowColor: WidgetStateProperty.all(
                    const Color(0xFF3B4668)),
                columnSpacing: 40,
                columns: [
                  DataColumn(label: whiteText("#")),
                  DataColumn(label: whiteText("Event Name")),
                  DataColumn(label: whiteText("Date & Time")),
                  DataColumn(label: whiteText("Venue")),
                  DataColumn(label: whiteText("Ticket Info")),
                  DataColumn(label: whiteText("Action")),
                ],
                rows: [
                  buildRow(
                      "1",
                      "Tech Conference 2026",
                      "15 Jan 2026\n10:00 AM - 01:00 PM",
                      "Main Auditorium",
                      "Price ₹599\nSeats 50",
                      "Active"),
                  buildRow(
                      "2",
                      "Cultural Fest",
                      "20 Jan 2026\n09:00 AM - 05:00 PM",
                      "Open Ground",
                      "Free Event\nSeats 200",
                      "Ended"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------- REUSABLE WIDGETS ----------

  Widget buildDropdown(String label, String hint,
      List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: const Color(0xFF5E6A75),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: const Color(0xFF5E6A75),
              hint: Text(hint,
                  style: const TextStyle(color: Colors.white70)),
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Colors.white),
              isExpanded: true,
              items: items.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e,
                      style:
                      const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMainButton(
      String text, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 50, // SAME SIZE
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: onTap,
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget exportButton(IconData icon, Color color) {
    return Container(
      height: 50,
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  static DataRow buildRow(
      String id,
      String name,
      String date,
      String venue,
      String ticket,
      String status) {
    return DataRow(cells: [
      DataCell(whiteText(id)),
      DataCell(whiteText(name)),
      DataCell(whiteText(date)),
      DataCell(whiteText(venue)),
      DataCell(whiteText(ticket)),
      DataCell(Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: status == "Ended"
              ? Colors.red
              : Colors.green,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(status,
            style: const TextStyle(color: Colors.white)),
      )),
    ]);
  }

  static Widget whiteText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
