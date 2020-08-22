import 'package:http/http.dart'; // to fetch/get data from any website
import 'dart:convert'; // to convert json data from string to map

class WorldTime {
  String location;  // location name for the UI
  String time;      // time for that location
  String flag;     // url to an asset flag icon
  String url;      //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  //Future is temporary placeholder value - like promise in JS
  Future<void> getTime() async{
    // make the request
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);
      // get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(dateTime);
      //print(offset);
      // create DateTime Object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time property
      time = now.toString();
    }
    catch(e){
     print('caught error: $e');
     time = 'Couldn\'t get time data';
    }

  }

}
