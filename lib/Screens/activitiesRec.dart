import 'dart:async';
import 'dart:io';

import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loc/Widgets/wrapper.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Widgets/helper.dart';

void main() => runApp(new ActivityRecognitionApp());

class ActivityRecognitionApp extends StatefulWidget {
  @override
  _ActivityRecognitionAppState createState() => _ActivityRecognitionAppState();
}

class _ActivityRecognitionAppState extends State<ActivityRecognitionApp> {
  StreamSubscription<ActivityEvent>? activityStreamSubscription;
  List<ActivityEvent> _events = [];
  final String name = Get.arguments[0];
  final Map<String, dynamic> exces = Get.arguments[1];
  ActivityRecognition activityRecognition = ActivityRecognition();
  CountDownController x = new CountDownController();
  int? minCountDown = 0;

  @override
  void initState() {
    setState(() {
      minCountDown = exces['duration'] * 60;
    });

    super.initState();
    _init();
    _events.add(ActivityEvent.unknown());
  }

  @override
  void dispose() {
    activityStreamSubscription?.cancel();
    super.dispose();
  }

  void _init() async {
    if (Platform.isAndroid) {
      if (await Permission.activityRecognition.request().isGranted) {
        _startTracking();
      }

      x.start();
    }

    // iOS does not
    else {
      _startTracking();
    }
  }

  void _startTracking() {
    activityStreamSubscription = activityRecognition
        .activityStream(runForegroundService: true)
        .listen(onData, onError: onError);
  }

  void onData(ActivityEvent activityEvent) {
    setState(() {
      _events.add(activityEvent);
    });
  }

  void onError(Object error) {
    // print('ERROR - $error');
  }

  @override
  Widget build(BuildContext context) {
    return themeWrapper(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              FeatherIcons.chevronLeft,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            exces['name'],
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
          //     child: CircleAvatar(
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(20),
          //         child: CachedNetworkImage(
          //           imageUrl: exces['img'],
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: Center(
          child: Column(
            children: [
              CircularCountDownTimer(
                duration: minCountDown!,
                initialDuration: 0,
                controller: x,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                ringColor: Colors.grey[300]!,
                ringGradient: null,
                fillColor: Colors.blue,
                fillGradient: null,
                backgroundColor: Colors.white,
                backgroundGradient: null,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 26.0,
                      foreground: Paint()..shader = linearGradient,
                    //color: Colors.black,
                    fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.S,
                isReverse: false,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () {
                  print('Countdown Ended');
                },
              ),
              ListTile(
                leading: _activityIcon(_events.last.type),
                title: Text(
                    '${_events.last.type.toString().split('.').last} (${_events.last.confidence}%)'),
                trailing: Text(_events.last.timeStamp
                    .toString()
                    .split(' ')
                    .last
                    .split('.')
                    .first),
              )
            ],
          ),

          // child: ListView.builder(
          //     itemCount: _events.length,
          //     reverse: true,
          //     itemBuilder: (_, int idx) {
          //       final activity = _events[idx];
          //       return ListTile(
          //         leading: _activityIcon(_events.last.type),
          //         title: Text(
          //             '${_events.last.type.toString().split('.').last} (${_events.last.confidence}%)'),
          //         trailing: Text(_events.last.timeStamp
          //             .toString()
          //             .split(' ')
          //             .last
          //             .split('.')
          //             .first),
          //       );
          //     }),
        ),
      ),
    );
  }

  Icon _activityIcon(ActivityType type) {
    switch (type) {
      case ActivityType.WALKING:
        return Icon(Icons.directions_walk);
      case ActivityType.IN_VEHICLE:
        return Icon(Icons.car_rental);
      case ActivityType.ON_BICYCLE:
        return Icon(Icons.pedal_bike);
      case ActivityType.ON_FOOT:
        return Icon(Icons.directions_walk);
      case ActivityType.RUNNING:
        return Icon(Icons.run_circle);
      case ActivityType.STILL:
        return Icon(Icons.cancel_outlined);
      default:
        return Icon(Icons.device_unknown);
    }
  }
}
