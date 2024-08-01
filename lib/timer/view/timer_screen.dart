import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_demo/timer/controller/timer_controller.dart';
import 'package:timer_demo/utils/app_prefernces.dart';

class TimerScreen extends StatelessWidget {
  TimerScreen({Key? key}) : super(key: key);

  final TimerController _timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                _timerController.formatTime(_timerController.seconds.value),
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                ),
              ).paddingOnly(bottom: 300);
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 42,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      if(!_timerController.play.value){
                        _timerController.savedTime();

                      }else{
                        _timerController.startTimer();
                        AppPreference.setInt("timer",_timerController.seconds.value);

                      }
                    },
                    child: Obx(
                      () => (!_timerController.play.value)
                          ? const Text(
                              'Pause',
                              style: TextStyle(fontSize: 15),
                            )
                          : const Text(
                              'Start',
                              style: TextStyle(fontSize: 15),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 42,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      _timerController.reset();
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 30),
          ],
        ),
      ),
    );
  }
}
