import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/custom_label.dart';
import 'package:changer/app/utils/components/home_dashboard_button.dart';
import 'package:changer/app/utils/components/plan_card.dart';
import 'package:changer/app/utils/routes.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:changer/app/views/user/accounting_details_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: AppSizes.percentHeight(30),
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(3, 3),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        width: AppSizes.percentWidth(100),
                        child: Column(
                          children: [
                            Expanded(
                                child: Image.asset('assets/images/logo.png')),
                            const Text('title'),
                            const Text('subtitle'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.all(AppSizes.percentWidth(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  roundButton(
                      label: 'Withdraw',
                      onPressed: () => Get.toNamed(Routes.addWithdrawMethod)),
                  roundButton(
                      label: 'Deposit',
                      onPressed: () => Get.toNamed(Routes.deposit)),
                ],
              ),
            ),
            Wrap(
              children: [
                HomeDashBoardButton(
                    icon: 'assets/images/company.svg',
                    label: 'Company Profile',
                    onTap: () => {}),
                HomeDashBoardButton(
                  icon: 'assets/images/reward.svg',
                  label: 'Rewards',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountingDetailsScreen(),
                      )),
                ),
                HomeDashBoardButton(
                    icon: 'assets/images/tutorials.svg',
                    label: 'Tutorials',
                    onTap: () => Get.toNamed(Routes.accountingDetails)),
                HomeDashBoardButton(
                  icon: 'assets/images/share.svg',
                  label: 'Invitations',
                  onTap: () => Get.toNamed(Routes.invitation),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomLabel(text: 'Our Plans'),
            ),
            Wrap(
              children: [
                PlanCard(
                  type: 'Basic',
                  minimum: 'Basic',
                  maximum: '\$0',
                  onTap: () => {},
                ),
                PlanCard(
                  type: 'Basic',
                  minimum: 'Basic',
                  maximum: '\$0',
                  onTap: () => {},
                ),
                PlanCard(
                  type: 'Basic',
                  minimum: 'Basic',
                  maximum: '\$0',
                  onTap: () => {},
                ),
                PlanCard(
                  type: 'Basic',
                  minimum: 'Basic',
                  maximum: '\$0',
                  onTap: () => {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget roundButton({required String label, required Function onPressed}) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: AppSizes.percentWidth(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            //shadow
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // has the effect of softening the shadow
              )
            ],
            color: primaryColor),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.percentWidth(3)),
          child: Center(
              child: Text(label, style: const TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
