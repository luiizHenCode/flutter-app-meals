import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BadgeMeal extends StatelessWidget {
  const BadgeMeal({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.0,
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18.0,
            color: Colors.white,
          ),
          const Gap(6.0),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              letterSpacing: 0.5,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
