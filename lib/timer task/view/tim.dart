import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_prefernces.dart';

class TimerLogicController extends GetxController with WidgetsBindingObserver {
  late Timer _timer;
  RxInt hours = 12.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  RxBool isRunning = false.obs;
  RxInt decrementSec = 1.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    getTime();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("App is in foreground");
        break;
      case AppLifecycleState.paused:
        print("App is in background");
      break;
      case AppLifecycleState.inactive:
        print("App is inactive");
        break;
      case AppLifecycleState.detached:
        print("App is detached");
        break;
    }
  }
  Future<String> getTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hours.value = prefs.getInt('hour') ?? 0;
    minutes.value = prefs.getInt('minute') ?? 0;
    seconds.value = prefs.getInt('second') ?? 0;
    if (hours.value == 0 && minutes.value == 0 && seconds.value == 0) {
      hours.value = 12;
      AppPreference.setHour("hour", hours.value);
    } else {
      startTimer();
    }
    return "${hours.value.toString().padLeft(2)} : ${minutes.value.toString().padLeft(2, '0')}: ${seconds.value.toString().padLeft(2, '0')}";
  }
  void changeDecrement(int value) {
    decrementSec.value = value;
    if (!isRunning.value) {
      startTimer();
    }
  }
  void startTimer() {
    isRunning.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (hours.value == 0 && minutes.value == 0 && seconds.value == 0) {
        isRunning.value = false;
        _timer.cancel();
      } else {
        if (decrementSec.value == 1) {
          decrementByOne();
        } else {
          decrementByTwo();
        }
        AppPreference.setHour("hour", hours.value);
        AppPreference.setMin("minute", minutes.value);
        AppPreference.setSec("second", seconds.value);
      }
    });
  }
  void decrementByOne() {
    if (seconds.value > 0) {
      seconds.value--;
    } else {
      if (minutes.value > 0) {
        minutes.value--;
        seconds.value = 59;
      } else {
        if (hours.value > 0) {
          hours.value--;
          minutes.value = 59;
          seconds.value = 59;
        }
      }
    }
  }
  void decrementByTwo() {
    if (seconds.value >= 2) {
      seconds.value -= 2;
    } else {
      if (minutes.value > 0) {
        minutes.value--;
        seconds.value = 58;
      } else {
        if (hours.value > 0) {
          hours.value--;
          minutes.value = 59;
          seconds.value = 58;
        }
      }
    }
  }
  String formattedTime() {
    String hrStr = hours.value.toString().padLeft(2, '0');
    String minStr = minutes.value.toString().padLeft(2, '0');
    String secStr = seconds.value.toString().padLeft(2, '0');
    return "$hrStr : $minStr : $secStr";
  }
  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}