import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = const Color(0xFF0B1026);
    final Color headerColor = const Color(0xFF3A4265);
    final Color cardColor = const Color(0xFF3A4265);
    final Color badgeColor = const Color(0xFF5F6B7A);
    final Color inputColor = const Color(0xFF5A6772);
    final Color buttonBlue = const Color(0xFF3F5BD9);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [

            /// TOP HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),
              color: headerColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.chat_bubble_outline,
                          color: Colors.white),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Ticket #4 - Issue with Fee Payment Portal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// BUTTON ROW
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      _badgeButton("BACK", badgeColor, () {
                        Navigator.pop(context);
                      }),
                      _badgeButton("OPEN", badgeColor, () {}),
                      _badgeButton("LOW", badgeColor, () {}),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// MESSAGE CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardColor,
                  border: Border.all(color: Colors.white30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.forum_outlined,
                        size: 60, color: Colors.white70),
                    SizedBox(height: 20),
                    Text(
                      "No replies yet. Start the conversation!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// MESSAGE INPUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: inputColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// FILE PICK ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: inputColor,
                        border:
                        Border.all(color: Colors.white38),
                      ),
                      child: const Text(
                        "Choose File",
                        style: TextStyle(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 45,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      decoration: BoxDecoration(
                        color: inputColor,
                        border:
                        Border.all(color: Colors.white38),
                      ),
                      child: const Text(
                        "No File Chosen",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// SEND BUTTON
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: const Text(
                    "SEND",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _badgeButton(
      String text, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 25, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}