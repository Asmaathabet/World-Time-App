import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
//    Navigator.pushNamed(context, '/home');
//    print(instance.time);
//    setState(() {
//      time = instance.time;
//    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime(); //async
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
     body: Center(
       child: SpinKitFadingCube(
         color: Colors.white,
         size: 50.0,
       ),
     ),
    );
  }
}
