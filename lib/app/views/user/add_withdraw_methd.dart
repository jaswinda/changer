import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/custom_button.dart';
import 'package:changer/app/utils/components/custom_label.dart';
import 'package:changer/app/utils/components/custom_textformfield.dart';
import 'package:changer/app/utils/components/notice.dart';
import 'package:changer/app/utils/components/pin_field.dart';
import 'package:changer/app/utils/routes.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddWithdraw extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();
  AddWithdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        title: const Text('Add Withdraw Method'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.percentWidth(2)),
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
              const CustomLabel(text: 'Add Withdrawal Method'),
              CustomTextField(
                  controller: addressController, hintText: 'Your USDT address'),
              const CustomLabel(text: 'Set Up a PIN'),
              PinField(pinController: pinController),
              const CustomLabel(text: 'Confirm PIN'),
              PinField(pinController: confirmPinController),
              CustomButton(
                  onTap: () => Get.offNamed(Routes.selectWithdrawMethod),
                  label: 'Confirm'),
              Notice(
                onCancel: () {},
                isHidden: false,
                text: 'You can add up to 2 withdrawal methods',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
