import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_demo/lithium/sign_up.dart';

import '../utils/images.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Languages",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "We help you in your own language.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
            SizedBox(
              height: 61,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade300)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImages.english,height: 36,width: 54,),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "English",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(SignUpScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                height: 50,
                width: 343,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text("Save",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
