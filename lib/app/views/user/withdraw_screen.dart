import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/custom_button.dart';
import 'package:changer/app/utils/components/custom_label.dart';
import 'package:changer/app/utils/components/custom_textformfield.dart';
import 'package:changer/app/utils/components/notice.dart';
import 'package:changer/app/utils/components/payment_method.dart';
import 'package:changer/app/utils/sizes.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.percentWidth(2)),
          child: Column(
            children: [
              Notice(
                onCancel: () {},
                isHidden: false,
                text: 'Withdrawal request will be processed within 24 hours',
              ),
              const CustomLabel(text: 'Selected Withdrawal Method: '),
              SizedBox(
                height: AppSizes.percentHeight(2),
              ),
              const Hero(
                tag: 'method1',
                child: PaymentMethod(
                  isSelected: true,
                  address: '0x00x00x00x00x00x00x00x00x00x00x0',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CustomLabel(text: 'Withdrawal Amount'),
                    CustomTextField(
                        isPhoneNumber: true,
                        controller: amountController,
                        hintText: '0.00'),
                    //horizontal list of amounts
                    SizedBox(
                      height: AppSizes.percentHeight(6),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => {
                                amountController.text =
                                    ((index + 1) * 100).toString()
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    //shadow
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius:
                                            10.0, // has the effect of softening the shadow
                                      )
                                    ],
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(((index + 1) * 100).toString()),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                    const CustomLabel(text: 'Withdrawal Fee'),
                    // const CustomLabel(text: 'Withdrawal Method'),
                    labelTile(label: 'Balance: ', value: 'value'),
                    labelTile(
                        label: 'Orders Completed today: ', value: 'value'),
                    labelTile(
                        label: 'Number of Withdrawals today', value: 'value'),
                    SizedBox(height: AppSizes.percentHeight(2)),

                    CustomButton(onTap: () {}, label: 'Confirm')
                  ],
                ),
              ),
            ],
          ),
        ),
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
