import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeDashBoardButton extends StatelessWidget {
  final String icon;
  final String label;
  final Function? onTap;
  const HomeDashBoardButton(
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
          width: Get.width / 2 - AppSizes.percentWidth(2) * 2,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            //shadow
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(3, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.percentWidth(2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //svg
                  SvgPicture.asset(
                    icon,
                    width: AppSizes.percentWidth(10),
                    height: AppSizes.percentHeight(9),
                    color: Colors.white,
                  ),
                  Center(
                    child: Text(
                      label,
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(2.0),
                          color: Colors.white),
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
