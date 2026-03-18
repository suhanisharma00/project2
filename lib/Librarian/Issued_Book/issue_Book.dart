import 'package:flutter/material.dart';
import 'Issue_list.dart';

class IssueBookPage extends StatefulWidget {
  const IssueBookPage({super.key});

  @override
  State<IssueBookPage> createState() => _IssueBookPageState();
}

class _IssueBookPageState extends State<IssueBookPage> {
  static const Color bgColor = Color(0xFF0B0D18);
  static const Color cardColor = Color(0xFF1B2238);
  static const Color fieldColor = Color(0xFF323B5C);
  static const Color blueBtn = Color(0xFF2563EB);
  static const Color greyBtn = Color(0xFF475569);

  String? selectedBook = "Principal of Financial Accounting";
  String? selectedUser = "Rajiv Menon(Staff)";
  
  final TextEditingController _issuedDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: blueBtn,
              onPrimary: Colors.white,
              surface: cardColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: bgColor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const Icon(Icons.add_circle, color: Colors.white, size: 28),
        title: const Text("Issue New Book",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const IssuedBooksListPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D3748),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("View Issued\nBooks", 
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// ISSUE BOOK DETAILS CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Column(
                      children: [
                        Text("Issue Book Details",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 4),
                        Text("Fill out the form to issue a new book to a user.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white54, fontSize: 13)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  buildLabel("Select Book"),
                  buildDropdownField(selectedBook, ["Principal of Financial Accounting", "Basics of Auditing", "Managerial Accounting"], (val) {
                    setState(() => selectedBook = val);
                  }),

                  buildLabel("Issue To (User)"),
                  buildDropdownField(selectedUser, ["Rajiv Menon(Staff)", "Rohit Kumar(Accountants)", "Nisha Rao(Student)"], (val) {
                    setState(() => selectedUser = val);
                  }),

                  buildLabel("Issued Date"),
                  buildDateField(_issuedDateController),

                  buildLabel("Due Date"),
                  buildDateField(_dueDateController),

                  const SizedBox(height: 24),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("UPDATE RECORD", 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greyBtn,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("CANCEL", 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            /// BOTTOM ISSUE BOOK BUTTON
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueBtn,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Issue Book", 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 16),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
    );
  }

  Widget buildDropdownField(String? value, List<String> items, Function(String?) onChanged) {
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

  Widget buildDateField(TextEditingController controller) {
    return InkWell(
      onTap: () => _selectDate(context, controller),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: fieldColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.text.isEmpty ? "dd-mm-yyyy" : controller.text,
              style: TextStyle(
                color: controller.text.isEmpty ? Colors.white24 : Colors.white,
                fontSize: 14,
              ),
            ),
            const Icon(Icons.calendar_month, color: Colors.white38, size: 20),
          ],
        ),
      ),
    );
  }
}
