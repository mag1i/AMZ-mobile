import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class info extends StatefulWidget {
  const info({Key? key}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {

  Future<void> fetchData() async {
    var apiUrl = 'http://localhost:8080/api/v1/'; // Replace with your teammate's API endpoint

    try {

      var response = await http.get(Uri.parse(apiUrl));
      Map<String, dynamic> jsonMap = json.decode(response.body);

      // Extract the "firstName"
      String firstName = jsonMap["firstName"];
      String lastName = jsonMap["lastName"];
      String email = jsonMap["email"];
      String passportNumber = jsonMap["passportNumber"];

      if (response.statusCode == 200) {
        // Parse and handle the response data here
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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('User information', style: TextStyle(color: Colors.white),),
    ),
    body:      Container(
    width: deviceWidth,
    height: deviceHeight,
    padding: EdgeInsets.fromLTRB(60,100, 50, 100),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/background.png'), // Replace with your image path
    fit: BoxFit.cover,
    ),
    ),
    child: Column(

    mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('\nFirst Name: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),textAlign: TextAlign.left,),
      Text('\n----------------------- ', style: TextStyle(fontSize: 20,  ),textAlign: TextAlign.left,),
     Text('\nLast Name: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
     Text('\n------------------------ ', style: TextStyle(fontSize: 20,),textAlign: TextAlign.left),
   Text('\nEmail: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
   Text('\n-----------@----.--', style: TextStyle(fontSize: 20),textAlign: TextAlign.left),
   Text('\nPassport Number: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left),
   Text('\n-------------------- ', style: TextStyle(fontSize: 20),textAlign: TextAlign.left),
   // Expanded( child: (Text(''))),
    ])));
  }
}
