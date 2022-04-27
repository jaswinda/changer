import 'package:changer/app/utils/colors.dart';
import 'package:flutter/material.dart';

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        title: const Text('Invitation'),
      ),
      body: const Center(
        child: Text('Invitation'),
      ),
    );
  }
}
