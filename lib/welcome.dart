import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class welcompage extends StatefulWidget {
  const welcompage({Key? key}) : super(key: key);

  @override
  State<welcompage> createState() => _welcompageState();
}

class _welcompageState extends State<welcompage> {
  final apiUrl = 'http://localhost:8080/api/v1/';
  late Timer _timer;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startPollingForUpdates();
  }
  void _startPollingForUpdates() {
    // Create a Timer that fires every 30 seconds
    _timer = Timer.periodic(Duration(seconds: 30), (Timer timer) {
      // Make an HTTP request to check for updates
      _checkForUpdates();
    });
  }

  Future<void> _checkForUpdates() async {
    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Handle the response data here
        var data = response.body;
        print('Received data: $data');
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    void dispose() {
      // Cancel the timer when the widget is disposed to prevent memory leaks
      _timer.cancel();
      super.dispose();
    }
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('AFZ', style: TextStyle(color: Colors.white),),
      ),
      body:      Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center( child:
        Container( width: deviceWidth,
          height: deviceHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Image.png'), // Replace with your image path
              fit: BoxFit.fitWidth,
            ),

          ),
         // child: Text('AFZ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, fontFamily: AutofillHints.countryCode),),
        )
        /*Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: (Text('\n\n\n\nWelcome to AFZ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, fontFamily: AutofillHints.countryCode),)
                  /*Container( width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('logo.png'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),)*/
              ),
            ),
            Expanded(
                child: Container( width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.png'), // Replace with your image path
                      fit: BoxFit.fitWidth,
                    ),

                  ),
                    child: Text('AFZ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, fontFamily: AutofillHints.countryCode),),
                    )
            ),



          ],
        )*/
        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
