import 'package:flutter/material.dart';

class CounselorPage extends StatelessWidget {
  const CounselorPage({super.key});

  static const Color bgColor = Color(0xff0b1330);
  static const Color cardColor = Color(0xff2a3566);
  static const Color fieldColor = Color(0xff4b587c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.people),
            SizedBox(width: 8),
            Text("Counselors"),
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
                "List of Counselors",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
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

              const SizedBox(height: 10),

              /// ICON BUTTONS
              Row(
                children: [

                  exportButton(Icons.copy, Colors.blue),

                  const SizedBox(width: 6),

                  exportButton(Icons.table_chart, Colors.lightBlue),

                  const SizedBox(width: 6),

                  exportButton(Icons.grid_on, Colors.green),

                  const SizedBox(width: 6),

                  exportButton(Icons.picture_as_pdf, Colors.red),

                  const SizedBox(width: 6),

                  exportButton(Icons.print, Colors.grey),
                ],
              ),

              const SizedBox(height: 14),

              /// TABLE
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(

                    headingRowColor: MaterialStateProperty.all(
                      const Color(0xff3a4678),
                    ),

                    columns: const [

                      DataColumn(
                          label: Text("#",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Employee",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Contact Information",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Position",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Status",
                              style: TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Actions",
                              style: TextStyle(color: Colors.white))),
                    ],

                    rows: [

                      DataRow(
                        cells: [

                          const DataCell(
                              Text("1",
                                  style:
                                  TextStyle(color: Colors.white))),

                          const DataCell(
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [

                                Text(
                                  "Ananya R. Singh",
                                  style: TextStyle(color: Colors.white),
                                ),

                                Text(
                                  "ID: 3",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          ),

                          const DataCell(
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [

                                Text(
                                  "ananya@iias.com",
                                  style: TextStyle(color: Colors.white),
                                ),

                                Text(
                                  "9812345678",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          ),

                          const DataCell(
                            Text(
                              "Senior Student Counselor",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          const DataCell(
                            Text(
                              "Active",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),

                          DataCell(

                            DropdownButtonHideUnderline(
                              child: DropdownButton(

                                dropdownColor: cardColor,

                                iconEnabledColor: Colors.white,

                                items: const [

                                  DropdownMenuItem(
                                    value: "view",
                                    child: Text("View",
                                        style: TextStyle(
                                            color: Colors.white)),
                                  ),

                                  DropdownMenuItem(
                                    value: "edit",
                                    child: Text("Edit",
                                        style: TextStyle(
                                            color: Colors.white)),
                                  ),

                                  DropdownMenuItem(
                                    value: "delete",
                                    child: Text("Delete",
                                        style: TextStyle(
                                            color: Colors.white)),
                                  ),

                                ],

                                onChanged: (value) {},
                              ),
                            ),

                          )
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
