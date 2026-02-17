import 'package:flutter/material.dart';

class Uploadstudymaterial extends StatefulWidget {
  const Uploadstudymaterial({super.key});

  @override
  State<Uploadstudymaterial> createState() => _UploadAssignmentPageState();
}

class _UploadAssignmentPageState extends State<Uploadstudymaterial> {
  final _formKey = GlobalKey<FormState>();

  String? selectedSchedule;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        title: const Text("Upload Material", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Schedule Dropdown
                const Text("Select Schedule *",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: selectedSchedule,
                  dropdownColor: const Color(0xFF1E293B),
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration("Select Schedule"),
                  iconEnabledColor: Colors.white,
                  items: [
                    "Class 10-A",
                    "Class 10-B",
                    "Class 11-A",
                    "Class 12-C"
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSchedule = value;
                    });
                  },
                  validator: (value) =>
                  value == null ? "Please select a schedule" : null,
                ),

                const SizedBox(height: 16),

                /// Title
                const Text("Title *",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration("Enter title"),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Title required" : null,
                ),

                const SizedBox(height: 16),

                /// Description
                const Text("Description",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: descController,
                  maxLines: 4,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration("Enter description (optional)"),
                ),

                const SizedBox(height: 16),

                /// Upload File Section
                const Text("Upload File *",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    // Logic to pick file would go here
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: const BoxDecoration(
                            color: Color(0xFF475569),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Text("Choose File",
                              style: TextStyle(color: Colors.white, fontSize: 13)),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text("No file chosen",
                                style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Allowed: PDF, Word, PPT, Images. Max: 20 MB.",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),

                const SizedBox(height: 16),




                /// Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Material Uploaded Successfully")),
                            );
                          }
                        },
                        child: const Text("UPLOAD", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white24),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text("CANCEL", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
      filled: true,
      fillColor: const Color(0xFF334155),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
      ),
    );
  }
}
