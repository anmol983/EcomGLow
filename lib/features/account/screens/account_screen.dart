import 'package:EcomGlow/constants/global_variables.dart';
import 'package:EcomGlow/features/account/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Lottie.asset(
                  'animations/shop.json', // Replace with your Lottie animation file path
                  width: 200,
                  height: 200,
                  fit: BoxFit
                      .contain, // Adjust this based on your animation's requirements
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10),
          SizedBox(
            height: 20,
          ),
          Orders(),
          SizedBox(
            height: 300,
          ),
          TopButtons(),
        ],
      ),
    );
  }
}
