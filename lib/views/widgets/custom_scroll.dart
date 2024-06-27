import 'package:flutter/material.dart';

class CustomScrollWidget extends StatelessWidget {
  final String buttonText;
  final int index;
  final int tappedIndex;
  final void Function(int index) onTap;

  const CustomScrollWidget({
    super.key,
    required this.buttonText,
    required this.index,
    required this.tappedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isTapped = tappedIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 0,
          right: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isTapped ? const Color(0xFF92C57B) : Colors.white,
          ),
          color: isTapped ? const Color(0xFF92C57B) : Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isTapped ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}