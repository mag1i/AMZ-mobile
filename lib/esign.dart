import 'dart:typed_data';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:afz/pay.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
class esign extends StatefulWidget {
  const esign({Key? key}) : super(key: key);

  @override
  State<esign> createState() => _esignState();
}

class _esignState extends State<esign> {
  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('User information', style: TextStyle(color: Colors.white),),
        ),
        body:     Center(child: Container(
            width: deviceWidth,
            height: deviceHeight,
            padding: EdgeInsets.fromLTRB(50, 60, 50, 60),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          child:Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Please sign below' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            SizedBox(height: 40,),
            Container(
            width:deviceWidth ,
                height: deviceHeight-500,
                color: Colors.white,

              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), // Adjust the border radius for rounded edges
                border: Border.all(width: 2.0), // Add a black border
              ),
              child:  Signature(
                controller: _controller,
                height: 200,
                backgroundColor: Colors.white,
              ),),
          ),
             SizedBox(height: 40,),
             Row(    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children:[
               ElevatedButton(style: ElevatedButton.styleFrom(
                 primary: Colors.white, // Set the background color to red
                 shape: RoundedRectangleBorder(

                   borderRadius: BorderRadius.circular(12.0), // Adjust the border radius for less rounded edges
                 ),
               ),onPressed: () async {
                 _controller.clear();
               },
                   child: Text('Clear', style: TextStyle(color: Colors.black),)),
             ElevatedButton(style: ElevatedButton.styleFrom(
              primary: Colors.black, // Set the background color to red
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Adjust the border radius for less rounded edges
              ),
            ),onPressed: () async {

               if(_controller.isNotEmpty) {
                 final signatureImage = await _controller.toPngBytes();
                 //var t= _controller.toImage();
                 var apiUrl = 'http://localhost:8080/api/v1/public/uploadSign'; // Replace with your API endpoint
              try {   var response = await http.post(
                Uri.parse(apiUrl),
                body: signatureImage,
                headers: {
                'Content-Type': 'image/png', // Set the content type as image/png
                },
                );

                if (response.statusCode == 200) {
                print('Image sent successfully.');
                } else {
                print('Failed to send image. Status code: ${response.statusCode}');
                }
                } catch (error) {
                print('Error: $error');
                }

    /*try {
    var request = http.MultipartRequest('POST', Uri.parse('YOUR_API_ENDPOINT_HERE'));

    // Add the image as a part to the multipart request
    request.files.add(http.MultipartFile.fromBytes(
    'image',  // Replace 'image' with the expected field name in your API
      signatureImage!,
    filename: 'image.png',
    contentType: MediaType('image', 'png'),
    ));

    // Send the request
    final response = await request.send();

    if (response.statusCode == 200) {
    // Successfully uploaded the image
    print('Image uploaded successfully');
    } else {
    // Handle the error
    print('Error uploading image: ${response.reasonPhrase}');
    }
    } catch (e) {
    print('Error: $e');
    }*/

                 print(signatureImage);
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>
                     ImageDisplayScreen(
                       signatureImageBytes: signatureImage!,)),);
               }
               else (_showSuccessSnackBar("No signature, sign first"));},
                child: Text('Submit', style: TextStyle(color: Colors.white),)),]),

          ],)
           )));
  }
}
class ImageDisplayScreen extends StatelessWidget {
  final Uint8List signatureImageBytes; // Assuming you have this variable

  ImageDisplayScreen({required this.signatureImageBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Display'),
      ),
      body: Center(
        child: Image.memory(
          signatureImageBytes,
          fit: BoxFit.contain, // Adjust the fit as needed
        ),
      ),
    );
  }
}
