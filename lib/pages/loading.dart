import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime() async {
    WorldTime instance =
    WorldTime(location: 'Athens', url: 'Europe/Berlin', flag: 'greece.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupTime();// bs ye change kiya kl ye likha nhi tha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitChasingDots(
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
