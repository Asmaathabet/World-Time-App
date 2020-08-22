import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // 3 functions - initState(), build(), Dispose()
  int counter = 0;
  void getData() async{
    // simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3),(){
     return 'asmaa';
    });
    // simulate network request for a bio
    String bio =  await Future.delayed(Duration(seconds: 2),(){
    return 'asmaa is a flutter developer';
    });
    print('$username - $bio ');
  }
  @override
  void initState() {
    super.initState();
    print('init state ran');
    getData(); //async
    print('Hey there !');
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('choose a Location'),
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
