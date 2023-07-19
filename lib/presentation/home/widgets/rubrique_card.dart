import 'package:flutter/material.dart';
import 'package:hospital/tools/extensions.dart';

class RubriqueCard extends StatelessWidget {
  const RubriqueCard({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    required this.badgeCount,
  });
  final void Function()? onTap;
  final String image;
  final String title;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.hardEdge,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              width: double.infinity,
              child: InkWell(
                onTap: onTap,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(image),
                    ),
                    5.ph,
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (badgeCount > 0)
            Positioned(
              right: -5,
              top: -5,
              child: Badge(
                backgroundColor: Colors.red,
                label: Text("$badgeCount"),
              ),
            ),
        ],
      ),
    );
  }
}
