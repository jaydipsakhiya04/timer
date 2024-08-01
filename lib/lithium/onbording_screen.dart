import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timer_demo/utils/images.dart';

import 'language_screen.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            // alignment: Alignment.topLeft,
            children: [
              Image.asset(AppImages.powerace),
              Positioned(
                top: 50,
                left: 14,
                child: Text("Welcome to Powerace ✨",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Manage Your Power",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            textAlign: TextAlign.center,
            "Enjoy your holiday with the lithium batteries from Powerace!",
            style: TextStyle(
              fontSize: 14,
                fontWeight: FontWeight.w400,
              color: Colors.grey
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              Get.to(LanguageScreen());
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              width: 343,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text("Let’s Start",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
