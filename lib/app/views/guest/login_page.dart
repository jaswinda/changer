import 'package:avsarmlm/app/controllers/auth_controller.dart';
import 'package:avsarmlm/app/utils/components/custom_button.dart';
import 'package:avsarmlm/app/utils/components/custom_textformfield.dart';
import 'package:avsarmlm/app/utils/routes.dart';
import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:avsarmlm/app/utils/transition.dart';
import 'package:avsarmlm/app/views/guest/signup_page.dart';
import 'package:avsarmlm/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppSizes.percentHeight(10)),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.percentHeight(2)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('LOGIN',
                          style: TextStyle(
                              fontSize: AppSizes.percentHeight(3),
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Login To Your Account',
                        style: TextStyle(
                            fontSize: AppSizes.percentHeight(2),
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.percentWidth(3.0)),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: AppSizes.percentHeight(2.5),
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )),
                        SizedBox(height: AppSizes.percentHeight(1)),
                        CustomTextField(
                          customValidator: (value) {
                            //email validation
                            final bool isValid = EmailValidator.validate(value);
                            if (!isValid) {
                              return 'Please enter a valid email';
                            }
                          },
                          controller: user,
                          obscureText: false,
                          hintText: 'Please enter your email',
                        ),
                        SizedBox(height: AppSizes.percentHeight(2)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: AppSizes.percentHeight(2.5),
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )),
                        SizedBox(height: AppSizes.percentHeight(1)),
                        CustomTextField(
                          controller: pass,
                          obscureText: true,
                          hintText: 'Please enter your password',
                        ),
                        const SizedBox(height: 40.0),
                        CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // authController.login(
                                //     email: user.text, password: pass.text);
                                //replace screen
                                sharedprefs!.setString('token', 'xxx');
                                Get.offAndToNamed(Routes.home);
                              }
                            },
                            label: 'Login'),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.percentHeight(3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Doesn't have an account?",
                        style: TextStyle(fontSize: AppSizes.percentHeight(2)),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(SignupPage());
                          Go.to(SignupPage());
                        },
                        child: Text(' Sign Up',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: AppSizes.percentHeight(2))),
                      ),
                    ],
                  ),
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: AppSizes.percentWidth(50),
                      height: AppSizes.percentHeight(20),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
