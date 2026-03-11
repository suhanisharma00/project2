import 'package:flutter/material.dart';

class MyLeaveApplication extends StatefulWidget {
  const MyLeaveApplication({Key? key}) : super(key: key);

  @override
  State<MyLeaveApplication> createState() => _MyLeaveApplicationState();
}

class _MyLeaveApplicationState extends State<MyLeaveApplication> {

  String? leaveType;
  String? status;

  @override
  Widget build(BuildContext context) {

    Color bg = const Color(0xff2e3556);
    Color card = const Color(0xff394066);
    Color button = const Color(0xff4b7bec);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// TOP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Leave Applications",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),

                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text("Apply For Leave"),
                    )
                  ],
                ),

                const SizedBox(height: 20),

                /// FILTER CARD
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: card,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Filter Applications",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Filter by Leave Type",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 6),

                      DropdownButtonFormField<String>(
                        dropdownColor: card,
                        value: leaveType,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xff4a5178),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        hint: const Text("Select an option",
                            style: TextStyle(color: Colors.white70)),
                        items: ["Casual", "Sick"]
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (v) {
                          setState(() {
                            leaveType = v;
                          });
                        },
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Filter by Status",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 6),

                      DropdownButtonFormField<String>(
                        dropdownColor: card,
                        value: status,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xff4a5178),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        hint: const Text("Select an option",
                            style: TextStyle(color: Colors.white70)),
                        items: ["Pending", "Approved", "Rejected"]
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (v) {
                          setState(() {
                            status = v;
                          });
                        },
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey),
                          onPressed: () {},
                          child: const Text("RESET"),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// APPLICATION HISTORY
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: card,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Application History",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "View the status of your past and current leave requests.",
                        style: TextStyle(color: Colors.white70),
                      ),

                      const SizedBox(height: 15),

                      /// SHOW ENTRIES + SEARCH
                      Row(
                        children: [

                          const Text("Show entries",
                              style: TextStyle(color: Colors.white)),

                          const SizedBox(width: 10),

                          DropdownButton<String>(
                            dropdownColor: card,
                            value: "10",
                            items: ["10", "25", "50"]
                                .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                                .toList(),
                            onChanged: (v) {},
                          ),

                          const Spacer(),

                          SizedBox(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "search records",
                                filled: true,
                                fillColor: const Color(0xff4a5178),
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// ICON BUTTONS
                      Row(
                        children: [
                          _iconButton(Icons.copy),
                          _iconButton(Icons.file_copy),
                          _iconButton(Icons.picture_as_pdf),
                          _iconButton(Icons.print),
                          _iconButton(Icons.download),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// TABLE
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.all(
                              const Color(0xff4a5178)),
                          columns: const [

                            DataColumn(label: Text("#")),
                            DataColumn(label: Text("Leave Type")),
                            DataColumn(label: Text("From")),
                            DataColumn(label: Text("To")),
                            DataColumn(label: Text("Reason")),
                            DataColumn(label: Text("Status")),
                            DataColumn(label: Text("Reviewed By")),
                            DataColumn(label: Text("Remarks")),
                            DataColumn(label: Text("Applied At")),

                          ],
                          rows: const [

                            DataRow(cells: [
                              DataCell(Text("1")),
                              DataCell(Text("Casual")),
                              DataCell(Text("04 May 0999")),
                              DataCell(Text("05 Jun 8987")),
                              DataCell(Text("-")),
                              DataCell(Text("Pending")),
                              DataCell(Text("Radhika Iyer")),
                              DataCell(Text("-")),
                              DataCell(Text("12 Feb 2026 08:59 PM")),
                            ]),

                            DataRow(cells: [
                              DataCell(Text("2")),
                              DataCell(Text("Sick")),
                              DataCell(Text("01 Nov 2025")),
                              DataCell(Text("03 Nov 2025")),
                              DataCell(Text("I am suffering from cold")),
                              DataCell(Text("Pending")),
                              DataCell(Text("Radhika Iyer")),
                              DataCell(Text("-")),
                              DataCell(Text("09 Oct 2025 10:33 AM")),
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: () {},
        child: Icon(icon, size: 18),
      ),
    );
  }
}