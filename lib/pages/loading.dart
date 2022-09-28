import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = "Loading...";
  // String timezone = "Loading...";
  late WorldTime instance;
  Future<void> setUpWorldTime() async {
    instance = WorldTime(
      url: 'Europe/London',
      flag: 'germany.png',
      continent: 'Europe',
      location: 'London',
    );
    // Map data = await instance.getData();
    await instance.getData();
    //Navigator.pushNamed(context, '/home');

    // print("location " + instance.location);
    // print("flag " + instance.flag);
    // print("time " + instance.time);
    // print("continent " + instance.continent);
    // print("instance : " + instance.toString());
    // setState(() {
    //   // print("(Loading) time = " + time);
    //   time = instance.time;
    //   // print("(Loading) time = " + time);
    //   timezone = "${instance.continent} \\ ${instance.location}";
    // });
    pushPageNavigator();
  }

  void pushPageNavigator() {
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'continent': instance.continent,
        'isDayTime': instance.isDayTime,
        'date': instance.date,
        'bgImage': instance.bgImage,
        'bgColor': instance.bgColor,
        // 'region': instance.region,
      },
    );
  }

  @override
  initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/day-night.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: SpinKitFadingCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              // Center(
              //   child: Text(
              //     timezone,
              //     style: const TextStyle(
              //       fontSize: 25.0,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // Center(
              //     child: RaisedButton(
              //   onPressed: () => print('clicked'),
              //   child: Icon(
              //     Icons.ads_click,
              //   ),
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
