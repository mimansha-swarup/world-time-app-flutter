import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty?data :ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDayTime']? 'day.png':'night.png';
    Color bgColor =data['isDayTime']? Colors.blue:Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data ={
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime' : result['isDayTime'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Edit location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50,
                    letterSpacing: 3,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
