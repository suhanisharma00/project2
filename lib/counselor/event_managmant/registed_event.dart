import 'package:flutter/material.dart';

class MyRegisteredEventsPage extends StatefulWidget {
  const MyRegisteredEventsPage({super.key});

  @override
  State<MyRegisteredEventsPage> createState() =>
      _MyRegisteredEventsPageState();
}

class _MyRegisteredEventsPageState extends State<MyRegisteredEventsPage> {
  String statusValue = "All";
  String typeValue = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0f2a),
      appBar: AppBar(
        backgroundColor: const Color(0xff3d4466),
        title: const Row(
          children: [
            Icon(Icons.event_available, color: Colors.white),
            SizedBox(width: 10),
            Text("My Registered Events",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// 🔵 FILTER CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff3d4466),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Row(
                    children: [
                      Icon(Icons.filter_alt, color: Colors.white),
                      SizedBox(width: 10),
                      Text("Filter Events",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text("Status",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16)),

                  const SizedBox(height: 8),

                  _buildDropdown(statusValue, (val) {
                    setState(() => statusValue = val!);
                  }),

                  const SizedBox(height: 20),

                  const Text("Type",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16)),

                  const SizedBox(height: 8),

                  _buildDropdown(typeValue, (val) {
                    setState(() => typeValue = val!);
                  }),

                  const SizedBox(height: 25),

                  /// 🔵 RESET BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4866d8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("RESET",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🔵 TABLE
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff3d4466),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [

                  /// Header Row
                  _tableHeader(),

                  const Divider(color: Colors.white24, height: 1),

                  /// Data Row
                  _tableRow(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 🔹 DROPDOWN
  Widget _buildDropdown(String value, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xff5a6670),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: value,
        dropdownColor: const Color(0xff3d4466),
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        style: const TextStyle(color: Colors.white),
        items: ["All", "Active", "Completed"]
            .map((e) =>
            DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  /// 🔹 TABLE HEADER
  Widget _tableHeader() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("#", style: TextStyle(color: Colors.white)),
          Text("Image", style: TextStyle(color: Colors.white)),
          Text("Title", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// 🔹 TABLE ROW
  Widget _tableRow() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                  flex: 1,
                  child: Text("1",
                      style: TextStyle(color: Colors.white))),
              Expanded(
                  flex: 1,
                  child: Text("Img",
                      style: TextStyle(color: Colors.white))),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Campus Cultural Fest 2025",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: 6),
                    Text(
                        "A vibrant celebration showcasing the diverse cultu...",
                        style:
                        TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(color: Colors.white24),

          /// 🔵 DETAILS ROW (BOTTOM PART)
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("03 Jan 2026\n09:00 AM - 04:00 PM",
                      style: TextStyle(color: Colors.white)),
                ],
              ),

              const Text("Seminar Hall",
                  style: TextStyle(color: Colors.white)),

              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xff5a6670),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("Free Event",
                    style: TextStyle(color: Colors.white)),
              ),

              const Text("09 Oct 2025\n12:16 PM",
                  style: TextStyle(color: Colors.white)),

              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xff5a6670),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("CANCEL\nREGISTRATION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
