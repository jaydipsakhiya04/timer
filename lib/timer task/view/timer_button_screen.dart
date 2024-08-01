import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timer_demo/timer%20task/view/timer_display_screen.dart';

class TimerButtonsScreen extends StatefulWidget {
  const TimerButtonsScreen({Key? key}) : super(key: key);

  @override
  State<TimerButtonsScreen> createState() => _TimerButtonsScreenState();
}

class _TimerButtonsScreenState extends State<TimerButtonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade800,
        title: const Text("Timer Buttons",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                 // Get.to( TimerDisplayScreen());
                    print("button 1 tap");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TimerDisplayScreen(),));
                  },
                  child: const Text(
                    'Button 1',
                    style: TextStyle(fontSize: 15),
                  ),
              )
            ),
            const SizedBox(height: 35,),
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {},
                  child: const Text(
                    'Button 2',
                    style: TextStyle(fontSize: 15),
                  ),
              )
            ),
            const SizedBox(height: 35,),
            SizedBox(
                height: 42,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {},
                  child: const Text(
                    'Button 3',
                    style: TextStyle(fontSize: 15),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
