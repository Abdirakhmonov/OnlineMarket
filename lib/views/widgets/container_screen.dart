
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool showImage;
  final Widget? additionalWidget;

  ContainerWidget({
    required this.firstText,
    required this.secondText,
    this.showImage = true,
    this.additionalWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 35),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstText,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        secondText,
                        style:
                        const TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
              if (showImage)
                const Icon(
                  Icons.arrow_right_alt_sharp,
                  size: 50,
                )
              else
                additionalWidget ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
