import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardButton extends StatelessWidget {
  const DashBoardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.percentWidth(2)),
      child: Container(
        height: AppSizes.percentHeight(15),
        width: Get.width / 3 - AppSizes.percentWidth(2) * 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          //shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Action',
            style: TextStyle(
                fontSize: AppSizes.percentHeight(2), color: Colors.black),
          ),
        ),
      ),
    );
  }
}
