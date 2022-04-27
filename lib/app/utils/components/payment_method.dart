import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final bool isSelected;
  final String address;
  const PaymentMethod({Key? key, this.isSelected = false, this.address = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: isSelected ? Border.all(color: primaryColor, width: 2) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: AppSizes.percentWidth(60),
            height: AppSizes.percentHeight(17),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/background_icons.png'),
                  fit: BoxFit.cover,
                  // ignore: unnecessary_new
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstIn),
                ),
                color: primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      5.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Withdraw Method',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.percentWidth(4),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.percentWidth(4),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'USDT Address: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppSizes.percentWidth(4),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.percentHeight(1),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        address,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSizes.percentWidth(3.5),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
