import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/custom_button.dart';
import 'package:changer/app/utils/components/custom_label.dart';
import 'package:changer/app/utils/components/dashboard_button%20copy.dart';
import 'package:changer/app/utils/components/home_dashboard_button.dart';
import 'package:changer/app/utils/components/notice.dart';
import 'package:changer/app/utils/components/payment_method.dart';
import 'package:changer/app/utils/routes.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SelectWithdrawMethod extends StatefulWidget {
  const SelectWithdrawMethod({Key? key}) : super(key: key);

  @override
  State<SelectWithdrawMethod> createState() => _SelectWithdrawMethodState();
}

class _SelectWithdrawMethodState extends State<SelectWithdrawMethod> {
  String selectedMethod = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        title: const Text('Select Withdraw Method'),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.percentWidth(2)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: 'withdraw',
                        child: SvgPicture.asset(
                          'assets/images/withdraw.svg',
                          width: AppSizes.percentWidth(100),
                          height: AppSizes.percentHeight(10),
                        ),
                      ),
                    ),
                    Text(
                      'Select the method you would like to withdraw your funds from',
                      style: TextStyle(
                        fontSize: AppSizes.percentWidth(4),
                        color: Colors.grey,
                      ),
                    ),
                    Notice(
                        onCancel: () {},
                        isHidden: false,
                        text: 'Please Touch the card to select the method'),
                    for (var i = 1; i <= 3; i++)
                      Padding(
                        padding: EdgeInsets.all(AppSizes.percentWidth(2)),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedMethod = i.toString();
                            });
                          },
                          child: Hero(
                            tag: 'method$i',
                            child: PaymentMethod(
                              isSelected: selectedMethod == i.toString(),
                              address: "0x00x00x00x00x00x00x00x00x00x00x0",
                            ),
                          ),
                        ),
                      ),
                    DashBoardButton(
                      icon: "assets/images/add.svg",
                      label: 'Add Withdrawal Method',
                      onTap: () => Get.offNamed(Routes.addWithdrawMethod),
                    ),
                  ],
                ),
              ),
            ),
            if (selectedMethod != "0")
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    onTap: () => Get.offNamed(Routes.withdraw),
                    label: 'Submit'),
              ),
          ],
        ),
      ),
    );
  }
}
