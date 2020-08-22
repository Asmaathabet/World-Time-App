import 'package:flutter/material.dart';
import 'package:http/http.dart'; // to fetch/get data from any website
import 'dart:convert'; // to convert json data from string to map

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // 3 functions - initState(), build(), Dispose()

  void getTime() async{
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Gaza');
    Map data = jsonDecode(response.body);
    // print(data);
    // get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
        print(dateTime);
//        print(offset);

    // create DateTime Object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);  // This will print right time now in Gaza
  }

  @override
  void initState() {
    super.initState();
    getTime(); //async
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
