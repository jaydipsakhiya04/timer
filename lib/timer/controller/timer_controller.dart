import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:timer_demo/utils/app_prefernces.dart';

class TimerController extends GetxService {
  @override
  void onInit() {
    print("7==${play.value}");
    getSavedTime();
    if (play.value) {
      print("value of play--${play.value}");
      savedTime();
      print("8==${play.value}");
      print("i am ifff");
    } else {
      print("i am elsee");
      print("9==${play.value}");
      startTimer();
    }
    super.onInit();
  }

  Timer? timer;
  RxInt seconds = 0.obs;
  RxBool play = false.obs;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // AppPreference.setInt("timer", seconds.value);
      // AppPreference.setBoolean("play", value: !play.value);
      print("play value---${play.value}");
      seconds++;
      AppPreference.setInt("timer", seconds.value);
      print("set Int---${AppPreference.setInt("timer", seconds.value)}");
    });
    play.value = false;
  }

  void getSavedTime() {
    int? savedSeconds = AppPreference.getInt("timer");
    bool? savePlay = AppPreference.getBoolean("play");
    if (savedSeconds != null) {
      seconds.value = savedSeconds;
      play.value = savePlay;
    }
  }

  void savedTime() {
    print("3==${play.value}");
    AppPreference.setInt("timer", seconds.value);
    print("2==${play.value}");
    AppPreference.setBoolean("play", value: !play.value);
    print("1==${play.value}");

    timer?.cancel();
    play.value = true;
  }

  String formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int remainingSeconds = totalSeconds % 3600;
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;

    String hourStr = hours.toString().padLeft(2, '0');
    String minStr = minutes.toString().padLeft(2, '0');
    String secondStr = seconds.toString().padLeft(2, '0');

    return '$hourStr : $minStr : $secondStr';
  }

  void reset() {
    AppPreference().clearSharedPreferences();
    timer?.cancel();
    play.value = true;
    seconds.value = 0;
  }
}

// void pauseTimer() {
//   isRunning.value = false;
//   timer?.cancel();
//   saveTime();
// }
//
// void saveTime() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setInt('hours', hours.value);
//   await prefs.setInt('minutes', minutes.value);
//   await prefs.setInt('seconds', seconds.value);
// }
//
// void loadSavedTime() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   hours.value = prefs.getInt('hours') ?? 12;
//   minutes.value = prefs.getInt('minutes') ?? 0;
//   seconds.value = prefs.getInt('seconds') ?? 0;
// }

// void startTimer() {
//   isRunning.value = true;
//   timer = Timer.periodic(Duration(seconds: 1), (_) {
//     if (hours.value == 0 && minutes.value == 0 && seconds.value == 0) {
//       isRunning.value = false;
//       timer?.cancel();
//       saveTime();
//       return;
//     }
//     if (seconds.value > 0) {
//       seconds.value--;
//     } else {
//       if (minutes.value > 0) {
//         minutes.value--;
//         seconds.value = 59;
//       } else {
//         if (hours.value > 0) {
//           hours.value--;
//           minutes.value = 59;
//           seconds.value = 59;
//         }
//       }
//     }
//     saveTime();
//   });
// }
