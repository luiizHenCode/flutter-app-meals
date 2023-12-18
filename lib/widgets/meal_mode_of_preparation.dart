import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MealModeOfPreparation extends StatelessWidget {
  const MealModeOfPreparation({
    super.key,
    required this.steps,
  });

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    int index = 1;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: steps.map((e) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 8.0),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.white,
                  child: Text(
                    "${index++}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Gap(16.0),
                Expanded(
                  child: Text(
                    e,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
