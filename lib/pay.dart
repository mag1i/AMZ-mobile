import 'package:afz/successfull.dart';
import 'package:flutter/material.dart';

import 'loadingscreen.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Payment', style: TextStyle(color: Colors.white),),
      ),
      body:      Container(
        width: deviceWidth,
        height: deviceHeight,
        padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[

          Text('Conofirm payment with this card', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

              GestureDetector(
                onTap: () {
                  // Add your button press logic here
                  Navigator.push(  context,MaterialPageRoute(builder: (context) => LoadingScreen(
                       )), );
                },
                child: Image.asset(
                  'images/crd.jpg', // Replace with the actual path to your image
                  width: deviceWidth, // Adjust the width as needed
                  height: 300, // Adjust the height as needed
                ),
              ),

              Text('Card details:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              Text('\nIBAN: -------------------', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Text('Card Holder Name: ----------------------------', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Text('Card number: -----------------------', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Text('Adress: -----------------------', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ]

        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
