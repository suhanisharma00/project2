import 'package:flutter/material.dart';

class SubjectManagementPage extends StatelessWidget {
  const SubjectManagementPage({super.key});

  static const Color bgColor = Color(0xff0b1330);
  static const Color cardColor = Color(0xff2a3566);
  static const Color fieldColor = Color(0xff4b587c);
  static const Color headerColor = Color(0xff3a4678);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.class_),
            SizedBox(width: 8),
            Text("Class Management"),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              const Text(
                "All Available Classes",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              /// EXPORT BUTTONS
              Row(
                children: [

                  exportButton(Icons.table_chart, Colors.lightBlue),

                  const SizedBox(width: 6),

                  exportButton(Icons.grid_on, Colors.green),

                  const SizedBox(width: 6),

                  exportButton(Icons.picture_as_pdf, Colors.red),

                  const SizedBox(width: 6),

                  exportButton(Icons.print, Colors.blue),
                ],
              ),

              const SizedBox(height: 12),

              /// SEARCH BAR
              Row(
                children: [

                  const Text(
                    "Show entries",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const Spacer(),

                  Container(
                    width: 170,
                    height: 34,
                    decoration: BoxDecoration(
                      color: fieldColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search Remarks",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 14),

              /// TABLE
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(

                    headingRowColor:
                    MaterialStateProperty.all(headerColor),

                    columns: const [

                      DataColumn(
                          label: Text("#",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Class Name",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Code",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Description",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Status",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Credit",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Type",
                              style: TextStyle(color: Colors.white))),
                    ],

                    rows: [

                      DataRow(
                        cells: [

                          const DataCell(
                            Text("1",
                                style: TextStyle(color: Colors.white)),
                          ),

                          const DataCell(
                            Text(
                              "Financial Accounting Basics",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.circular(6),
                              ),
                              child: const Text(
                                "FAB101",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),

                          const DataCell(
                            SizedBox(
                              width: 200,
                              child: Text(
                                "Introduction to fundamental accounting principles",
                                style:
                                TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                BorderRadius.circular(6),
                              ),
                              child: const Text(
                                "Graduation",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),

                          DataCell(
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "VIEW SECTIONS (2)",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// EXPORT BUTTON
  Widget exportButton(IconData icon, Color color) {
    return Container(
      width: 36,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
