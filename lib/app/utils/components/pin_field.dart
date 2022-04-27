import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinField extends StatelessWidget {
  final TextEditingController pinController;
  final Function? validator;
  const PinField({Key? key, required this.pinController, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.percentWidth(2)),
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 4,
        obscureText: true,
        obscuringCharacter: '*',
        obscuringWidget: Padding(
          padding: EdgeInsets.all(AppSizes.percentWidth(2)),
          child: SvgPicture.asset(
            'assets/images/logo.svg',
          ),
        ),
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: (v) => validator != null ? validator!(v) : null,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: AppSizes.percentHeight(7),
          fieldWidth: AppSizes.percentWidth(14),
          inactiveColor: Colors.white,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          activeColor: primaryColor,
          selectedColor: primaryColor,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        // errorAnimationController: errorController,
        controller: pinController,

        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        onCompleted: (v) {
          debugPrint("Completed");
        },
        // onTap: () {
        //   print("Pressed");
        // },
        onChanged: (value) {
          debugPrint(value);
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
