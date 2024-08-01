import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timer_demo/utils/app_prefernces.dart';

class TimerLogicController extends GetxController with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    AppPreference.getInt("speed");
    getTime();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log("state:---$state");
    switch (state) {
      case AppLifecycleState.resumed:
        getTime();
        AppPreference.setHour("hour", hours.value);
        AppPreference.setMin("minute", minutes.value);
        AppPreference.setSec("second", seconds.value);
        AppPreference.getInt("speed");

        print("App is in foreground");
        log('fore time ---${hours.value}:${minutes.value}:${seconds.value}');
        break;
      case AppLifecycleState.paused:
        print("App is in background");
        // getTime();
        AppPreference.setHour("hour", hours.value);
        AppPreference.setMin("minute", minutes.value);
        AppPreference.setSec("second", seconds.value);
        // AppPreference.setInt("speed", decrementSec.value);
        AppPreference.getInt("speed");
        log('back time--- ${hours.value}:${minutes.value}:${seconds.value}');
        break;
      case AppLifecycleState.inactive:
        print("App is inactive");
        // AppPreference.getInt("speed");
        // AppPreference.setHour("hour", hours.value);
        // AppPreference.setMin("minute", minutes.value);
        // AppPreference.setSec("second", seconds.value);
        // getTime();
        // log('inactive time--- ${hours.value}:${minutes.value}:${seconds.value}');
        break;
      case AppLifecycleState.detached:
        minutes.value=5;
        getTime();
        AppPreference.setHour("hour", hours.value);
        AppPreference.setMin("minute", minutes.value);
        AppPreference.setSec("second", seconds.value);
        // AppPreference.setInt("speed", decrementSec.value);

        print("App is detached");
        log('detached time--- ${hours.value}:${minutes.value}:${seconds.value}');
        hours.value = 0;
        break;

    }
  }

  Timer? _timer;
  RxInt hours = 12.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  RxBool isRunning = false.obs;
  RxInt decrementSec = 1.obs;

  void changeDecrement(int value) {
    decrementSec.value = value;
    if (!isRunning.value) {
      // AppPreference.setInt("speed", decrementSec.value);
      startTimer();
    }
  }

  void startTimer() {
    isRunning.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (hours.value == 0 && minutes.value == 0 && seconds.value == 0) {
        isRunning.value = false;
        _timer?.cancel();
      } else {
        if (decrementSec.value == 1) {
          decrementByOne();
        } else {
          decrementByTwo();
        }
        AppPreference.setInt("speed", decrementSec.value);
      }
    });
  }

  void decrementByOne() {
    if (seconds.value > 0) {
      seconds.value--;
    } else if (minutes.value > 0) {
      minutes.value--;
      seconds.value = 59;
    } else if (hours.value > 0) {
      hours.value--;
      minutes.value = 59;
      seconds.value = 59;
    }
  }

  void decrementByTwo() {
    if (seconds.value >= 2) {
      seconds.value -= 2;
    } else {
      seconds.value = 60 - (2 - seconds.value);
      if (minutes.value > 0) {
        minutes.value--;
      } else {
        if (hours.value > 0) {
          hours.value--;
          minutes.value = 59;
        }
      }
    }
  }

  String formattedTime() {
    String hrStr = hours.value.toString().padLeft(2);
    String minStr = minutes.value.toString().padLeft(2, '0');
    String secStr = seconds.value.toString().padLeft(2, '0');

    AppPreference.setHour("hour", hours.value);
    AppPreference.setMin("minute", minutes.value);
    AppPreference.setSec("second", seconds.value);
    // AppPreference.setInt("speed", decrementSec.value);

    return "$hrStr : $minStr : $secStr";
  }

  Future<String> getTime() async {
    hours.value = AppPreference.getHour('hour');
    minutes.value = AppPreference.getMin('minute');
    seconds.value = AppPreference.getSec('second');

    if (hours.value == 0) {
      print("zero being 12");
      hours.value = 12;
      AppPreference.setHour("hour", hours.value);
    } else {
      print("isRunning-1---${isRunning.value}");
      startTimer();
    }
    return "${hours.value.toString().padLeft(2)} : ${minutes.value.toString().padLeft(2, '0')}: ${seconds.value.toString().padLeft(2, '0')}";
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    print("onClose-----");
    getTime();
    AppPreference.setHour("hour", hours.value);
    AppPreference.setMin("minute", minutes.value);
    AppPreference.setSec("second", seconds.value);
    super.onClose();
  }
}
