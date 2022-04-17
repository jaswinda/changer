import 'package:avsarmlm/app/utils/colors.dart';
import 'package:avsarmlm/app/utils/components/custom_button.dart';
import 'package:avsarmlm/app/utils/components/custom_label.dart';
import 'package:avsarmlm/app/utils/components/custom_textformfield.dart';
import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  final amountController = TextEditingController();
  WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        title: const Text('Withdraw'),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.percentWidth(2)),
        child: Column(
          children: [
            notice(
                text: 'Withdrawal request will be processed within 24 hours'),
            Container(
              padding: EdgeInsets.all(AppSizes.percentWidth(2)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                //shadow
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CustomLabel(text: 'Withdrawal Amount'),
                  CustomTextField(
                      isPhoneNumber: true,
                      controller: amountController,
                      hintText: '0.00'),
                  // const CustomLabel(text: 'Withdrawal Method'),
                  labelTile(label: 'Balance: ', value: 'value'),
                  labelTile(label: 'Orders Completed today: ', value: 'value'),
                  labelTile(
                      label: 'Number of Withdrawals today', value: 'value'),
                  SizedBox(height: AppSizes.percentHeight(2)),
                  const CustomLabel(text: 'Selected Withdrawal Method'),
                  CustomButton(onTap: () {}, label: 'Confirm')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notice({required String text}) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.percentWidth(2)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.percentWidth(2)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              //shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(AppSizes.percentWidth(2)),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: AppSizes.percentHeight(1.5),
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: -AppSizes.percentHeight(1),
            right: 0,
            child: const Icon(Icons.cancel_outlined),
          ),
        ],
      ),
    );
  }

  Widget labelTile({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.percentWidth(1)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
          //shadow
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.percentWidth(2)),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.percentWidth(2)),
                  child: Text(label),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.percentWidth(2)),
                  child: Text(value),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
