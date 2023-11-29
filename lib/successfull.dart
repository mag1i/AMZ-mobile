import 'package:afz/pay.dart';
import 'package:afz/welcome.dart';
import 'package:flutter/material.dart';

class success extends StatefulWidget {
  const success({Key? key}) : super(key: key);

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
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
        padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[


              Container( width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120.0), // Adjust the border radius for rounded edges
                  border: Border.all(width:12.0, color: Colors.grey),
                 image: DecorationImage(
                    image: AssetImage('images/tick.png'), // Replace with your image path
                    fit: BoxFit.fitWidth,
                  ),
                ),

              ),
              SizedBox(height: 30,),
              Text('Congraulations!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
              Text('Your payment has been sent successfully, Thank you for using AFZ.', style: TextStyle( fontSize: 20),textAlign: TextAlign.center,),
             SizedBox(height: 50,),
              Row(  children: [ Text('Recipient', style: TextStyle( fontSize: 18),textAlign: TextAlign.left,),
              SizedBox(width: 100,), Expanded(child:Text('--------------------', style: TextStyle( fontSize: 20),textAlign: TextAlign.right,)),   ],),
             //SizedBox(height: 10,),
              Row(children: [ Text('Email', style: TextStyle( fontSize: 18),textAlign: TextAlign.left,),
                SizedBox(width: 100,), Expanded(child:Text('--------------------', style: TextStyle( fontSize: 20),textAlign: TextAlign.right,)),   ],),
             // SizedBox(height: 8,),
              Divider(
                color: Colors.black,
                thickness: 1.0, // Adjust the thickness of the line
              ),
             // SizedBox(height: 8,),
              Row(children: [ Text('Bill', style: TextStyle( fontSize: 18),textAlign: TextAlign.left,),
                SizedBox(width: 100,), Expanded(child:Text('--------------------', style: TextStyle( fontSize: 20),textAlign: TextAlign.right,)),   ],),
             // SizedBox(height: 10,),
              Row(children: [ Text('Charge', style: TextStyle( fontSize: 18),textAlign: TextAlign.left,),
                SizedBox(width: 100,), Expanded(child:Text('--------------------', style: TextStyle( fontSize: 20),textAlign: TextAlign.right,)),   ],),
             // SizedBox(height: 10,),
              Row(children: [ Text('Paid amount', style: TextStyle( fontSize: 18),textAlign: TextAlign.left,),
                SizedBox(width: 100,), Expanded(child:Text('--------------------', style: TextStyle( fontSize: 20),textAlign: TextAlign.right,)),   ],),

              SizedBox(height: 30,),


              ElevatedButton(style: ElevatedButton.styleFrom(
                primary: Colors.black, // Set the background color to red
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0), // Adjust the border radius for less rounded edges
                ),
              ),onPressed: (){
                Navigator.push(  context,MaterialPageRoute(builder: (context) => payment()), );
              },
                  child: Text('Back to home', style: TextStyle(color: Colors.white),)) ]

        ),

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
