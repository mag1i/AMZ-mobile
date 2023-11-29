import 'dart:math';

import 'package:flutter/material.dart';
import 'package:afz/successfull.dart';
class LoadingScreen extends StatelessWidget {
  LoadingScreen();

  Future<void> loadFunction() async {
    await Future.delayed(Duration(seconds: 5)); // Simulate a 4-second loading time
  }

  Widget placeholderBuilder(BuildContext context) {
    return YourCustomLoadingWidget(); // Return the widget using the arrow notation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Center(
        child: FutureBuilder(
          future: loadFunction(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Loading is complete, navigate to the main screen
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => success()),
                );
              });

              // Return the placeholder widget
              return placeholderBuilder(context);
            } else {
              // Loading is in progress, show a loading indicator
              return placeholderBuilder(context);
            }
          },
        ),
      ),
    );
  }
}
/* SizedBox(height: 30,),
          Text('On processing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),textAlign: TextAlign.center,),
          Text('Keep your mobile payment close until the payment is complete', style: TextStyle( fontSize: 20, color: Colors.white),textAlign: TextAlign.center,),
*/

class YourCustomLoadingWidget extends StatefulWidget {
  @override
  _YourCustomLoadingWidgetState createState() => _YourCustomLoadingWidgetState();
}

class _YourCustomLoadingWidgetState extends State<YourCustomLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressTween;
  late Animation<double> _rotationTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _progressTween = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _rotationTween = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Start the animation
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          Text('On processing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),textAlign: TextAlign.center,),
          Text('Keep your mobile payment close until the payment is complete', style: TextStyle( fontSize: 20, ),textAlign: TextAlign.center,),
          SizedBox(height: 30,),
          //CircularProgressIndicator(),
         /* AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return SizedBox(
                width: 100.0,
                height: 100.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(
                    3,
                        (index) {
                      final angle = 2 * index * pi / 3;
                      final radius = 20.0 * (index + 1);

                      return PulseAnimation(
                        animation: _animationController,
                        child: Positioned(
                          top: radius * sin(angle),
                          left: radius * cos(angle),
                          child: CircleWidget(),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),*/
      Stack(   
        children: [
          Container(

            //padding: EdgeInsets.fromLTRB(50, 30, 40, 50),
            width: deviceWidth,
            height:400,
            /*  decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/crd.jpg'), // Use NetworkImage for web images
                //  fit: BoxFit.fill ,
              ),
            ),*/
            child: Image.asset('images/Design sans titre.gif'),
          ),
          Container(
       // padding: EdgeInsets.fromLTRB(50, 30, 40, 50),
        width: deviceWidth-20,
         height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/crd.jpg'), // Use NetworkImage for web images
          //  fit: BoxFit.fill ,
          ),
        ),
          //  child: Image.asset('images/Design sans titre.gif'),
          ),
         ]),
          SizedBox(height: 20,),
          LinearProgressIndicator(
            value: _progressTween.value,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          SizedBox(height: 16.0),
          Text(
            'Loading...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
class PulseAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  PulseAnimation({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: TweenSequence(
        [
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 1),
          TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 1),
        ],
      ).animate(animation),
      child: child,
    );
  }
}

class CircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }
}