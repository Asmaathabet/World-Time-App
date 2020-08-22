import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // 3 functions - initState(), build(), Dispose()
  String time = 'Loading';
  void setupWorldTime() async{
    // create an instance of world time app
    WorldTime instance = WorldTime(location: 'Gaza', flag: 'palestine.png', url: 'Asia/Gaza');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime(); //async
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
