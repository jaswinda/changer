import 'package:avsarmlm/app/utils/colors.dart';
import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DashBoardButton extends StatelessWidget {
  final String icon;
  final String label;
  final Function? onTap;
  const DashBoardButton(
      {Key? key,
      this.icon = 'assets/images/account.svg',
      this.label = '',
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Padding(
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
            child: Padding(
              padding: EdgeInsets.all(AppSizes.percentWidth(2)),
              child: Column(
                children: [
                  //svg
                  SvgPicture.asset(
                    icon,
                    width: AppSizes.percentWidth(10),
                    height: AppSizes.percentHeight(9),
                    color: primaryColor,
                  ),
                  Center(
                    child: Text(
                      label,
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(1.5),
                          color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
