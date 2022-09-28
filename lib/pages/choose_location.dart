// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/location_list.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const  ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  late WorldTime newTime;

  Future<void> updateTime({
    required BuildContext context,
    required int index,
  }) async {
    newTime = locations[index];
    await newTime.getData();

    // print('new item daytime : ' + newTime.isDayTime.toString());
    // print('new item time : ' + newTime.time.toString());

    Navigator.pop(context, {
      'location': newTime.location,
      'flag': newTime.flag,
      'time': newTime.time,
      'continent': newTime.continent,
      'isDayTime': newTime.isDayTime,
      'date': newTime.date,
      'bgImage': newTime.bgImage,
      'bgColor': newTime.bgColor,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('Location.build() ran');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              color: Colors.black,
              child: ListTile(
                onTap: () {
                  // print(locations[index].continent);
                  updateTime(context: context, index: index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/${locations[index].flag}',
                  ),
                ),
                title: Text(
                  '${locations[index].continent} / ${locations[index].location}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
