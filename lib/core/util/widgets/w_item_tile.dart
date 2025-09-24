
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/core/util/widgets/w_vertical_divider.dart';

class WItemTile extends StatelessWidget {
  final String field;
  final String value;
  const WItemTile({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // field input field
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: AutoSizeText(
                field,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                minFontSize: 12,
              ),
            ),
          ),

          WVerticalDevider(),

          // value
          SizedBox(
            width: 120,
            child: Center(
              child: AutoSizeText(
                value,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                minFontSize: 8,
              ),
            ),
          ),

          WVerticalDevider(),
        ],
      ),
    );
  }
}