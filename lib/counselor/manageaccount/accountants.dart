import 'package:flutter/material.dart';

class AccountantPage extends StatelessWidget {
  const AccountantPage({super.key});

  static const bgColor = Color(0xff0b1330);
  static const cardColor = Color(0xff2f3a5f);
  static const fieldColor = Color(0xff5b6b73);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text("Accountants"),
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
                "List of Institute Managers",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              /// SHOW ENTRIES + SEARCH
              Row(
                children: [

                  const Text("Show entries",
                      style: TextStyle(color: Colors.white70)),

                  const Spacer(),

                  Container(
                    width: 180,
                    height: 34,
                    decoration: BoxDecoration(
                      color: fieldColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search Remarks",
                        hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 12),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

              /// EXPORT BUTTONS
              Row(
                children: [

                  iconButton(Icons.copy, Colors.blue),
                  const SizedBox(width: 6),

                  iconButton(Icons.table_chart, Colors.lightBlue),
                  const SizedBox(width: 6),

                  iconButton(Icons.grid_on, Colors.green),
                  const SizedBox(width: 6),

                  iconButton(Icons.picture_as_pdf, Colors.red),
                  const SizedBox(width: 6),

                  iconButton(Icons.print, Colors.grey),
                ],
              ),

              const SizedBox(height: 12),

              /// TABLE
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: DataTable(

                    headingRowColor:
                    MaterialStateProperty.all(
                        const Color(0xff3a4678)),

                    columns: const [

                      DataColumn(
                          label: Text("#",
                              style:
                              TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Employee",
                              style:
                              TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Contact Information",
                              style:
                              TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Position",
                              style:
                              TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Status",
                              style:
                              TextStyle(color: Colors.white))),

                      DataColumn(
                          label: Text("Actions",
                              style:
                              TextStyle(color: Colors.white))),
                    ],

                    rows: [

                      DataRow(cells: [

                        const DataCell(Text("1",
                            style:
                            TextStyle(color: Colors.white))),

                        const DataCell(Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [

                            Text("Rajveer K. Malhotra",
                                style: TextStyle(
                                    color: Colors.white)),

                            Text("MID: 1",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11))
                          ],
                        )),

                        const DataCell(Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [

                            Text("raj@iias.com",
                                style: TextStyle(
                                    color: Colors.white)),

                            Text("9012345678",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11))
                          ],
                        )),

                        const DataCell(Text(
                          "General Manager",
                          style: TextStyle(color: Colors.white),
                        )),

                        const DataCell(Text(
                          "Active",
                          style: TextStyle(
                              color: Colors.green),
                        )),

                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.more_vert,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ])
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

  /// ICON BUTTON
  Widget iconButton(IconData icon, Color color) {
    return Container(
      width: 34,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: Colors.white, size: 16),
    );
  }
}
