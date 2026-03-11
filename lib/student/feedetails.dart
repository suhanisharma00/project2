import 'package:flutter/material.dart';

class StudentFeePage extends StatelessWidget {
  const StudentFeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a1230),

      appBar: AppBar(
        backgroundColor: const Color(0xff0a1230),
        elevation: 0,
        title: const Text(
          "Student Fee Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// STUDENT INFO
            infoCard(),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Fee Summary",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            summaryCard(Icons.payments, "Total Fee", "₹36,600.00"),
            const SizedBox(height: 15),

            summaryCard(Icons.warning, "Total Fines", "₹1,000.00"),
            const SizedBox(height: 15),

            summaryCard(Icons.receipt, "Total Payable", "₹37,600.00"),
            const SizedBox(height: 15),

            summaryCard(Icons.check_circle, "Paid", "₹1,000.00"),
            const SizedBox(height: 15),

            summaryCard(Icons.cancel, "Due", "₹36,600.00"),

            const SizedBox(height: 25),

            feeDetailsTable(),

            const SizedBox(height: 25),

            fineDetailsTable(),

            const SizedBox(height: 25),

            paymentHistoryTable(),
          ],
        ),
      ),
    );
  }

  /// STUDENT CARD
  Widget infoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff3c4566),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Name:  Nisha Rao", style: TextStyle(color: Colors.white)),
          SizedBox(height: 5),

          Text("Roll No:  25IIAS2UG103",
              style: TextStyle(color: Colors.white)),

          SizedBox(height: 5),

          Text("Class:  Cost Analysis and Management A",
              style: TextStyle(color: Colors.white)),

          SizedBox(height: 5),

          Text("Email:  nisha@iias.com",
              style: TextStyle(color: Colors.white)),

          SizedBox(height: 5),

          Text("Fee Frequency:  yearly",
              style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// SUMMARY CARD
  Widget summaryCard(IconData icon, String title, String amount) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xff3c4566),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [

          Icon(icon, color: Colors.white, size: 40),

          const SizedBox(height: 10),

          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),

          const SizedBox(height: 5),

          Text(amount,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  /// FEE DETAILS TABLE
  Widget feeDetailsTable() {
    return tableCard(
      "Fee Details",
      [
        dataRow(["1", "Admission Fee", "₹5,000.00", "Institute-Wide"]),
        dataRow(["2", "Library Fee", "₹3,600.00", "Institute-Wide"]),
        dataRow([
          "3",
          "Tuition Fee",
          "₹20,000.00",
          "Class Specific"
        ]),
      ],
      const ["#", "Fee Title", "Amount", "Type"],
    );
  }

  /// FINE DETAILS TABLE
  Widget fineDetailsTable() {
    return tableCard(
      "Fine Details",
      [
        dataRow([
          "1",
          "Damage Fee Fine",
          "₹1,000.00",
          "Fine for damage"
        ])
      ],
      const ["#", "Reason", "Amount", "Remarks"],
    );
  }

  /// PAYMENT HISTORY
  Widget paymentHistoryTable() {
    return tableCard(
      "Payment History",
      [
        DataRow(cells: [

          const DataCell(Text("1",
              style: TextStyle(color: Colors.white))),

          const DataCell(Text("₹1,000.00",
              style: TextStyle(color: Colors.white))),

          const DataCell(Text("09 Oct 2025",
              style: TextStyle(color: Colors.white))),

          const DataCell(Text("Cash",
              style: TextStyle(color: Colors.white))),

          const DataCell(Text("REF123",
              style: TextStyle(color: Colors.white))),

          const DataCell(Text("-",
              style: TextStyle(color: Colors.white))),

          const DataCell(Text("Admin",
              style: TextStyle(color: Colors.white))),

          DataCell(
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),

              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),

              child: const Text(
                "Print Receipt",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ])
      ],
      const [
        "#",
        "Paid Amount",
        "Date",
        "Mode",
        "Reference",
        "Remark",
        "Submitted By",
        "Action"
      ],
    );
  }

  /// TABLE CARD
  Widget tableCard(
      String title,
      List<DataRow> rows,
      List<String> columns) {

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3c4566),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(

              columns: columns
                  .map((c) => DataColumn(
                  label: Text(c,
                      style: const TextStyle(
                          color: Colors.white))))
                  .toList(),

              rows: rows,
            ),
          ),
        ],
      ),
    );
  }

  DataRow dataRow(List<String> cells) {
    return DataRow(
      cells: cells
          .map((e) => DataCell(
          Text(e, style: const TextStyle(color: Colors.white))))
          .toList(),
    );
  }
}
