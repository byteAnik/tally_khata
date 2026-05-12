import 'package:flutter/material.dart';
import 'package:tally_khata/constants/app_colors.dart';
import 'package:tally_khata/helpers/ui_helpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UIHelper.kDefaulutPadding(),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Hello boy tally',
                  style: TextStyle(color: AppColors.c000000)),
                ],
              ),
            ),
            ),
            ),
    );
  }
}