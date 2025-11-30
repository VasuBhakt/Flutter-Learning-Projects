import 'package:flutter/material.dart';

class AdditionalInfoCard extends StatelessWidget {
  final String attribute;
  final double value;
  final Icon icon;

  const AdditionalInfoCard({
    super.key,
    required this.attribute,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                attribute,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              icon,
              const SizedBox(height: 16),
              Text(value.toStringAsFixed(2), style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
