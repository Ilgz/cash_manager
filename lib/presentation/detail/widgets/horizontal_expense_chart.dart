import 'package:flutter/material.dart';

class HorizontalExpenseChart extends StatelessWidget {
  final List<int> values;
  final List<Color> colors;
  const HorizontalExpenseChart({super.key, required this.values, required this.colors});
  @override
  Widget build(BuildContext context) {
    if(values.isEmpty){
      return SizedBox();
    }else{
    int total = values.reduce((a, b) => a + b);
    return Row(
      children: values.asMap().entries.map((entry) {
        int index = entry.key;
        int value = entry.value;
        double percentage = (value / total) * 100;
        return Expanded(
          flex: value,
          child: Column(
            children: [
              Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '${percentage.toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: colors[index],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
    }

  }
}