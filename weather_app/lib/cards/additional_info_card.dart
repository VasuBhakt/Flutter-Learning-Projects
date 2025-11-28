import 'package:flutter/material.dart';

class AdditionalInfoCard extends StatelessWidget {

  final String attribute;
  final double value;

  const AdditionalInfoCard({super.key, required this.attribute, required this.value});
  Icon _retIcon() {
    double iconSize = 32;
    if(attribute=="Humidity") {
      return Icon(Icons.water_drop, size: iconSize,);
    } else if(attribute=="Wind Speed") {
      return Icon(Icons.air, size: iconSize,);
    } else if(attribute=="Visibility") {
      return Icon(Icons.remove_red_eye, size: iconSize,);
    }
    return Icon(Icons.question_mark, size: iconSize,);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  attribute,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 8),
                _retIcon(),
                Text(
                  "$value",
                  style: TextStyle(
                    fontSize: 12
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }

}