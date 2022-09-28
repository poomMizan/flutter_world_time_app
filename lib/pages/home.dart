// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  // String location = "Loading...";
  // String flag = "Loading...";
  // String time = "Loading...";
  // String continent = "Loading...";
  // String date = "Loading";
  // String bgImage = "assets/images/day.png";
  // late String bgImage;
  // late bool isDayTime;
  // Color bgColor = Colors.blue;
  // late Color bgColor;

  @override
  Widget build(BuildContext context) {
    //  print('data in home : ' + data.toString());
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);
    String imageUrl = "assets/images/";

    // print('bgImage : ' + bgImage.toString());
    // print('bgImage Type : ' + bgImage.runtimeType.toString());
    // print('bgColor : ' + bgColor.toString());
    // print('bgColor Type : ' + bgColor.runtimeType.toString());

    // print('data bgImage] : ' + data['bgImage'].toString());
    // print('data bgImage Type : ' + data['bgImage'].runtimeType.toString());
    // print('data bgColor : ' + data['bgColor'].toString());
    // print('data bgColor Type : ' + data['bgColor'].runtimeType.toString());

    // setState(() {
    //   location = data['location'];
    //   flag = data['flag'];
    //   time = data['time'];
    //   continent = data['continent'];
    //   date = data['date'];
    //   // isDayTime = data['isDayTime'];
    //   bgImage = data['bgImage'];
    //   bgColor = data['bgColor'];
    // });

    // print("isDayTime = " + data['isDayTime'].toString());


   // String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
   // Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    // data['isDayTime'] = false;
    Color fontColor = Colors.white;

    return Scaffold(
      backgroundColor: data['bgColor'],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                data['bgImage'],
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 35, 0.0, 0.0),
                child: FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');

                    if (result != null) {
                      setState(() {
                        data = {
                          'location': result['location'] ?? "Unknow",
                          'flag': result['flag'] ?? "Unknow",
                          'time': result['time'] ?? "Unknow",
                          'continent': result['continent'] ?? "Unknow",
                          'date': result['date'] ?? "Unknow",
                          // 'isDayTime': result['isDayTime'],
                          'bgImage' : result['bgImage'] ?? "assets/images/day-night.png",
                          'bgColor': result['bgColor'] ?? Colors.grey[200],
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: fontColor,
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      fontSize: 23.5,
                      color: fontColor,
                    ),
                  ),
                ),
              ),
              // Center(
              //   child: Text(
              //     continent,
              //     style: TextStyle(fontSize: 45.0),
              //   ),
              // ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                    child: Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 45.0,
                        color: fontColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Text(
                      data['date'],
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // Center(
                  //   child: Text(flag),
                  // ),
                  // SizedBox(
                  //   height: 15.0,
                  // ),
                  Center(
                    child: Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 45.0,
                        color: fontColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
