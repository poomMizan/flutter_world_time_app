import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String continent;
  late String location;
  late String time;
  late String flag;
  late String region;
  // bool isDayTime = true;
  late bool isDayTime;
  late String date;
  // String bgImage = "assets/images/day.png";
  late String bgImage;
  // Color bgColor = Colors.blue;
  late Color bgColor;
  late String url;

  WorldTime({
    required this.url,
    required this.location,
    required this.flag,
    required this.continent,
  });

  Future<void> getData(
      //   {
      //   required String continent,
      //   required String location,
      // }
      ) async {
    try {
      // print("before get...");
      String url_api = 'http://worldtimeapi.org/api/timezone/${url}';
      // String url = 'http://worldtimeapi.org/api/timezone/America/New_York';
      // print(url);
      Response response = await get(Uri.parse(url_api));
      // print('after get');

      if (response.statusCode != 200 || response.statusCode == 404) {
        print('Request failed with status: ${response.statusCode}.');
        // result = {
        //   'time': "Unknow",
        //   'timezone': "Unknow",
        // };
        // return;
      }
      // print("response : " + response.toString());
      else {
        Map data = await jsonDecode(response.body);
        // print("data : " + data.toString());

        String datetime = await data['datetime'];
        // print('after assign data to string var');
        String offset = await data['utc_offset'];
        String offsetSub = offset.substring(0, 3);
        String timezone = await data['timezone'];
        // print("$datetime / $offsetSub");
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offsetSub)));
        // print('before assign now to time...');

        isDayTime = (now.hour > 6 && now.hour < 19);

        if (isDayTime) {
          bgImage = "assets/images/day.png";
          bgColor = Colors.blue;
        } else {
          bgImage = "assets/images/night.png";
          bgColor = Colors.black;
        }

        // print('bgImage : ' + bgImage.toString());
        // print('bgImage Type : ' + bgImage.runtimeType.toString());
        // print('bgColor : ' + bgColor.toString());
        // print('bgColor Type : ' + bgColor.runtimeType.toString());

        // time = now.toString();
        time = DateFormat.jm().format(now);
        date = DateFormat.yMMMMEEEEd().format(now);

        // print("(WorldTime) time = " + time);
        // result = {
        //   'time': now.toString(),
        //   'timezone': timezone,
        // };
        // return result;
      }
    } catch (error) {
      // print('error caught : $error');
      time = region = "Unable to get data";
    }
  }
}
