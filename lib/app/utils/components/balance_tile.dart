import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class BalanceTile extends StatelessWidget {
  final String heldBalance;
  final String availableBalance;
  final double horizontalPadding;
  const BalanceTile(
      {Key? key,
      required this.heldBalance,
      required this.availableBalance,
      this.horizontalPadding = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.percentWidth(1)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.percentWidth(5),
            vertical: AppSizes.percentHeight(5)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.percentWidth(0.5)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.percentWidth(50)),
                color: Colors.white,
                border: Border.all(color: primaryColor, width: 2),
              ),
              child: Container(
                width: AppSizes.percentWidth(25),
                height: AppSizes.percentWidth(25),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/1/1f/Dwayne_Johnson_2014_%28cropped%29.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(AppSizes.percentWidth(50)),
                    border: Border.all(color: primaryColor, width: 2)),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: AppSizes.percentWidth(2),
                      ),
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: AppSizes.percentHeight(2),
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      SizedBox(
                        width: AppSizes.percentWidth(2),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.percentWidth(50)),
                          color: primaryColor,
                          border: Border.all(color: primaryColor, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lvl 1',
                            style: TextStyle(
                                fontSize: AppSizes.percentHeight(1.5),
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.percentHeight(1)),
                  Row(
                    children: [
                      SizedBox(
                        width: AppSizes.percentWidth(2),
                      ),
                      Text(
                        'Avl Balance: ',
                        style: TextStyle(
                            fontSize: AppSizes.percentHeight(2),
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      SizedBox(
                        width: AppSizes.percentWidth(2),
                      ),
                      Text(
                        '100 USD',
                        style: TextStyle(
                            fontSize: AppSizes.percentHeight(2),
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.percentHeight(1)),
                  Row(
                    children: [
                      SizedBox(
                        width: AppSizes.percentWidth(2),
                      ),
                      Text(
                        'Invitation Code: ',
                        style: TextStyle(
                            fontSize: AppSizes.percentHeight(2),
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      SizedBox(
                        width: AppSizes.percentWidth(2),
                      ),
                      Text(
                        'dasdsa',
                        style: TextStyle(
                            fontSize: AppSizes.percentHeight(2),
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.percentHeight(1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
