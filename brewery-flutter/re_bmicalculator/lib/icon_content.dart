import 'package:flutter/material.dart';

const TextStyle labelTextStyle = TextStyle(
  fontSize: 18.8,
  color: Color(0xFF8D8E98),
);
const double ikonSize = 80.0;
const double sizedBoxHeight = 15.0;

class IconContent extends StatelessWidget {
  IconContent({@required this.ikon, @required this.label});

  final IconData ikon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            ikon,
            size: ikonSize,
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Text(
            label,
            style: labelTextStyle,
          )
        ],
      ),
    );
  }
}
