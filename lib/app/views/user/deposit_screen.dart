import 'dart:io';

import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/custom_button.dart';
import 'package:changer/app/utils/components/custom_label.dart';
import 'package:changer/app/utils/components/custom_textformfield.dart';
import 'package:changer/app/utils/components/notice.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  var _image;
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        title: const Text('Deposit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.percentWidth(2)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Notice(
                      onCancel: () {},
                      isHidden: false,
                      text: 'Note: We only Accept TRC20 USDT Tokens',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const CustomLabel(text: 'Deposit Amount'),
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
                                          (((index + 1) * 20).toString())
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
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
                                        child: Text(
                                            (((index + 1) * 20).toString())),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: 10,
                            ),
                          ),

                          labelTile(
                              label: "Receiver's Address: ",
                              value: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'),
                          Notice(
                            onCancel: () {},
                            isHidden: false,
                            text:
                                'Note: It is forbidden to use the TXID or HASH of the other users. The amount of the transaction will be frozen if found so.',
                          ),
                          SizedBox(height: AppSizes.percentHeight(2)),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Get.bottomSheet(Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            //from gallery
                                            Expanded(
                                              child: InkWell(
                                                onTap: () =>
                                                    onPickFromGallery(),
                                                child: pickerWidget(
                                                    title: 'Gallery',
                                                    IconData: Icons.image),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () =>
                                                    onPickFromGallery(),
                                                child: pickerWidget(
                                                    title: 'Camera',
                                                    IconData: Icons.camera_alt),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                              },
                              child: _image != null
                                  ? Card(
                                      child: Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200]),
                                          child: Image.file(
                                            _image,
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.fitHeight,
                                          )))
                                  : Container(
                                      width: AppSizes.percentWidth(50),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.add_a_photo,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: AppSizes.percentWidth(2),
                                            ),
                                            const Text('Attach Payment Proof'),
                                          ],
                                        ),
                                      )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(onTap: () {}, label: 'Confirm')
          ],
        ),
      ),
    );
  }

  Widget pickerWidget({required title, required IconData IconData}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
        border: Border.all(
          color: Colors.yellow,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(IconData, color: Colors.white),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  onPickFromGallery() async {
    try {
      image = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File(image!.path);
      });
    } catch (e) {}
    Get.back();
  }

  onPickFromCamera() async {
    try {
      image = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = File(image!.path);
      });
    } catch (e) {}
    Get.back();
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
                flex: 2,
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
