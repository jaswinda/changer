import 'package:avsarmlm/app/utils/sizes.dart';
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
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            image: DecorationImage(
              image: const AssetImage('assets/images/background_icons.png'),
              fit: BoxFit.cover,
              // ignore: unnecessary_new
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstIn),
            ),
            color: Colors.black),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.percentWidth(5),
              vertical: AppSizes.percentHeight(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      heldBalance,
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(3),
                          color: Colors.white),
                    ),
                    SizedBox(height: AppSizes.percentHeight(1)),
                    Text(
                      'Held Balance',
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(1.5),
                          color: Colors.white),
                    ),
                    Text(
                      'USD',
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(1.5),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      availableBalance,
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(3),
                          color: Colors.white),
                    ),
                    SizedBox(height: AppSizes.percentHeight(1)),
                    Text(
                      'Available Balance',
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(1.5),
                          color: Colors.white),
                    ),
                    Text(
                      'USD',
                      style: TextStyle(
                          fontSize: AppSizes.percentHeight(1.5),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
