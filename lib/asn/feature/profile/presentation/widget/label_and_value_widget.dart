import 'package:flutter/material.dart';

class LabelValueWidget extends StatelessWidget {
  final String label;
  final String value;
  const LabelValueWidget(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 9, color: Colors.grey)),
          SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}
