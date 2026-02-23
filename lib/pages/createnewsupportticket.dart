import 'package:flutter/material.dart';

class CreateSupportTicketPage extends StatefulWidget {
  const CreateSupportTicketPage({super.key});

  @override
  State<CreateSupportTicketPage> createState() =>
      _CreateSupportTicketPageState();
}

class _CreateSupportTicketPageState
    extends State<CreateSupportTicketPage> {

  String priorityValue = "Low";

  final TextEditingController titleController =
  TextEditingController();
  final TextEditingController descriptionController =
  TextEditingController();
  final TextEditingController categoryController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0f2a),
      appBar: AppBar(
        backgroundColor: const Color(0xff3d4466),
        title: const Row(
          children: [
            Icon(Icons.support_agent, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Create New Support Ticket",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xff3d4466),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 Issue Title
              const Text("Issue Title *",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18)),

              const SizedBox(height: 8),

              _buildTextField(titleController),

              const SizedBox(height: 20),

              /// 🔹 Issue Description
              const Text("Issue Description *",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18)),

              const SizedBox(height: 8),

              _buildTextField(descriptionController,
                  maxLines: 4),

              const SizedBox(height: 20),

              /// 🔹 Priority Dropdown
              const Text("Priority *",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18)),

              const SizedBox(height: 8),

              _buildDropdown(),

              const SizedBox(height: 20),

              /// 🔹 Category
              const Text("Category (Optional)",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18)),

              const SizedBox(height: 8),

              _buildTextField(categoryController,
                  hint: "e.g., fee, login, issue"),

              const SizedBox(height: 30),

              /// 🔹 Buttons Row
              Row(
                children: [

                  /// Submit Button
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xff4866d8),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "SUBMIT TICKET",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// Back Button
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xff5a6670),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "BACK",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 TextField Style (Same as image)
  Widget _buildTextField(TextEditingController controller,
      {int maxLines = 1, String? hint}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
        const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xff5a6670),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// 🔹 Dropdown Style (Same as image)
  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xff5a6670),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: priorityValue,
        isExpanded: true,
        dropdownColor: const Color(0xff3d4466),
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down,
            color: Colors.white),
        style: const TextStyle(color: Colors.white),
        items: ["Low", "Medium", "High"]
            .map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ))
            .toList(),
        onChanged: (val) {
          setState(() {
            priorityValue = val!;
          });
        },
      ),
    );
  }
}
