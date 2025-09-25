import 'package:flutter/material.dart';

class WBottomRoundedButton extends StatelessWidget {
  final String label;
  final EdgeInsets margin; // ,
  final Function() ontap;
  final Function() onError;
  final bool Function() isEnabled; //,
  final bool isLoading;
  const WBottomRoundedButton({
    super.key,
    required this.label,
    this.margin = const EdgeInsets.only(bottom: 20, left: 10, right: 10),
    required this.ontap,
    required this.isEnabled,
    this.isLoading = false, required this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        return isEnabled() ? ontap(): onError();
      },
      child: Stack(
        children: [
          Container(
            height: 60,
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:Colors.white,
            ),
            alignment: AlignmentGeometry.center,
            child: isLoading
                ? CircularProgressIndicator()
                : Text(
                    "$label",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }
}
