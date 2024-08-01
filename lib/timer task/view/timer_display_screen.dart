import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_demo/timer%20task/controller/timer_logic_controller.dart';

class TimerDisplayScreen extends StatelessWidget {
  TimerDisplayScreen({Key? key}) : super(key: key);

  final TimerLogicController _timerLogicController = Get.put(TimerLogicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo.shade800,
        title: const Text("Timer Screen", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                _timerLogicController.formattedTime(),
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: Colors.green.shade800),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  _timerLogicController.changeDecrement(1);
                },
                child: const Text(
                  '1x',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 42,
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  _timerLogicController.changeDecrement(2);
                },
                child: const Text(
                  '2x',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
