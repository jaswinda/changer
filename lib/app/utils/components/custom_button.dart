import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final onTap;
  final String label;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSizes.percentHeight(7),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: AppSizes.percentHeight(3), color: Colors.white),
          ),
        ),
      ),
    );
  }
}
