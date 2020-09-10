import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:search_widget/search_widget.dart';

/*
*
*/

void main() {
  runApp(MaterialApp(
    title: 'Deal Dayz',
    // Start the app with the "/" named route. In this case, the app starts
    // on the CardMemberScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the CardMemberScreen widget.
      // '/': (context) => CardMemberScreen(),
      '/': (context) => MyHomePageState(),
      // When navigating to the "/merchant" route, build the MerchantScreen widget.
      '/merchant': (context) => MerchantScreen(),
      // When navigating to the "/merchant/adddeal" route, build the AddDeal widget.
      '/merchant/adddeal' : (context) => AddDeals(),
      // '/merchant/adddeal' : (context) => MerchantActions(),
      '/home': (context) => MyHomePageState(),
      '/deals' : (context) => DisplayDeals(),
      '/merchantdeals' : (context) => MerchantDeals(),
    },
  ));
}

class CardMemberScreen extends StatelessWidget {
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/amexlogo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Deal Dayz'))
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: NiceButton(
          radius: 40,
          padding: const EdgeInsets.all(15),
          text: "Are you a Merchant?",
          icon: Icons.account_box,
          gradientColors: [secondColor, firstColor],
          background: secondColor,
          onPressed: () {
            // Navigate to the merchant screen using a named route.
            Navigator.pushNamed(context, '/merchant');
          },
        ),
      ),
    );
  }
}

class DisplayDeals extends StatefulWidget{

  @override
  _DisplayDeals createState() => _DisplayDeals();

}


class _DisplayDeals extends State<DisplayDeals>{

  double iconSize = 40;
  @override
  Widget build(BuildContext context) {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("Deals"),
            centerTitle: true,
          ),
          body: Center(
              child: Column(children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white, fontSize: 36),
                    children: <TextSpan>[
                      TextSpan(text: 'Active Deals ', style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                      )
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow( children: [
                        Column(children:[
                          Text('Sales ID', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),)
                        ]),
                        Column(children:[
                          Text('Product Name', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),)
                        ]),
                        Column(children:[
                          Text('Price', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),)
                        ]),
                        // Column(children:[
                        //   Text('Description', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),)
                        // ]),
                        Column(children:[
                          Text('Amount', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),)
                        ]),
                        // Column(children:[
                        //   Text('Start Date', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),)
                        // ]),
                        // Column(children:[
                        //   Text('End Date', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),)
                        // ]),
                        // Column(children:[
                        //   Text('Redemption Number', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,backgroundColor: Colors.blueAccent),)
                        // ]),
                        // Column(children:[
                        //   Text('On/Off', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,backgroundColor: Colors.blueAccent),)
                        // ],

                      ]),
                      TableRow( children: [
                        Text('101',textAlign: TextAlign.center,),
                        Text('Smart TV',textAlign: TextAlign.center,),
                        Text('\$299',textAlign: TextAlign.center,),
                        Image.asset('images/buynow.jpg')
                        // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                        // // Icon(Icons.cake, size: iconSize,),
                        // // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                      ]),
                      TableRow( children: [
                        Text('102',textAlign: TextAlign.center,),
                        Text('Bicycle',textAlign: TextAlign.center,),
                        Text('\$199',textAlign: TextAlign.center,),
                        Image.asset('images/buynow.jpg')
                        // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                        // // Icon(Icons.cake, size: iconSize,),
                        // // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                      ]),
                      TableRow( children: [
                        Text('103',textAlign: TextAlign.center,),
                        Text('Laptop',textAlign: TextAlign.center,),
                       Text('\$399',textAlign: TextAlign.center,),
                        Image.asset('images/buynow.jpg')
                        // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                        // // Icon(Icons.cake, size: iconSize,),
                        // // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                      ]),
                      TableRow( children: [
                        Text('104',textAlign: TextAlign.center,),
                        Text('T-Shirt',textAlign: TextAlign.center,),
                        Text('\$6',textAlign: TextAlign.center,),
                        Image.asset('images/buynow.jpg')
                        // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                        // // Icon(Icons.cake, size: iconSize,),
                        // // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                      ]),
                      TableRow( children: [
                        Text('105',textAlign: TextAlign.center,),
                        Text('Varidesk',textAlign: TextAlign.center,),
                        Text('\$149',textAlign: TextAlign.center,),
                        Image.asset('images/buynow.jpg')
                        // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                        // // Icon(Icons.cake, size: iconSize,),
                        // // Icon(Icons.voice_chat, size: iconSize,),
                        // Icon(Icons.add_location, size: iconSize,),
                      ]),
                    ],
                  ),
                ),
                NiceButton(
                  width: 255,
                  elevation: 20.0,
                  radius: 52.0,
                  text: "Home",
                  icon: Icons.home,
                  background: firstColor,
                  onPressed: () {
                    print("Place order...");
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ]))),
    );
  }
}


class MerchantDeals extends StatefulWidget{
  @override
  _MerchantDeals createState() => _MerchantDeals();

}

class _MerchantDeals extends State<MerchantDeals> {
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Androidmonks',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Merchant - Your Ongoing Sales"),
            centerTitle: true,
          ),
          backgroundColor: Colors.white70,
          body: Center(


            // child: new Column(
              //   children: <Widget>[
              //     DataTable(
              //       columns: [
              //         DataColumn(label: Text("Sales Id")),
              //         DataColumn(label: Text("Product Name")),
              //         DataColumn(label: Text("Description")),
              //         DataColumn(label: Text("Price")),
              //         DataColumn(label: Text("From Date")),
              //         DataColumn(label: Text("To Date"))
              //       ],
              //       rows: [
              //         DataRow(cells: [
              //           DataCell(Text("101")),
              //           DataCell(Text("Iphone 11")),
              //           DataCell(Text("Iphone 11, 64 gb, ")),
              //           DataCell(Text("\$699")),
              //           DataCell(Text("09/09/2020")),
              //           DataCell(Text("10/09/2020")),
              //         ]),
              //         DataRow(cells: [
              //           DataCell(Text("102")),
              //           DataCell(Text("Iphone XR")),
              //           DataCell(Text("Iphone XR, 64 gb, ")),
              //           DataCell(Text("\$499")),
              //           DataCell(Text("09/09/2020")),
              //           DataCell(Text("10/09/2020")),
              //         ]
              //         ),
              //       ],
              //     ),
              //     NiceButton(
              //       radius: 40,
              //       padding: const EdgeInsets.all(15),
              //       text: "Home",
              //       icon: Icons.home,
              //       gradientColors: [secondColor, firstColor],
              //       background: secondColor,
              //       onPressed: () {
              //         print("*****Navigating to home*****");
              //         Navigator.pushNamed(context, '/home');
              //       },
              //     )
              //   ],
              // )
          ),
        )
    );
  }

}


// class MerchantActions extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Merchant Actions',
//
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Merchant Actions'),
//           centerTitle: true,
//         ),
//         // body: new AddDeals(),
//         body: new Material(
//
//         ),
//       ),
//     );
//   }
// }

class MerchantScreen extends StatelessWidget {
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Merchant Section"),
        centerTitle: true,
      ),
      body: new Material(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NiceButton(
                  width: 255,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Add Deals",
                  icon: Icons.add_to_queue,
                  background: firstColor,

                  onPressed: () {
                    print("Add a deal...");
                    Navigator.pushNamed(context, '/merchant/adddeal');
                  },
                ),
                NiceButton(
                  radius: 40,
                  padding: const EdgeInsets.all(15),
                  text: "List Ongoing Deals",
                  icon: Icons.local_offer,
                  gradientColors: [secondColor, firstColor],
                  background: firstColor,
                  onPressed: () {
                    print("Show deals posted by this merchant...");
                    Navigator.pushNamed(context, '/merchantdeals');
                  },
                ),
                NiceButton(
                  radius: 40,
                  padding: const EdgeInsets.all(15),
                  text: "Home",
                  icon: Icons.home,
                  gradientColors: [secondColor, firstColor],
                  background: secondColor,
                  onPressed: () {
                    print("*****Navigating to home*****");
                    Navigator.pushNamed(context, '/home');
                  },
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/amexlogo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Deal Dayz'))
          ],
        ),
        centerTitle: true,
      ),
      body: new Material(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('images/logo.png'),
                NiceButton(
                  width: 255,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Explore Deals",
                  icon: Icons.local_offer,
                  background: firstColor,
                  onPressed: () {
                    print("list available deals");
                    Navigator.pushNamed(context, '/deals');
                  },
                ),
                NiceButton(
                  radius: 40,
                  padding: const EdgeInsets.all(15),
                  text: "Are you a Merchant?",
                  icon: Icons.account_box,
                  gradientColors: [secondColor, firstColor],
                  background: secondColor,
                  onPressed: () {
                    print("Routing to merchant section to add deals...");
                    Navigator.pushNamed(context, '/merchant');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddDeals extends StatefulWidget{
  @override
  _AddDeal createState(){
    return _AddDeal();
  }
}

// class _AddDeal extends StatelessWidget {
class _AddDeal extends State<AddDeals>{

  File _image;
  Text _text;
  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
  bool _camera_load = false;
  bool _gallery_load = false;
  bool _isImageAvailable = false;
  @override
  Widget build(BuildContext context) {
    Widget camloadingIndicator =_camera_load? new Container(
      color: Colors.white70,
      width: 100.0,
      height: 100.0,
      child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    ):new Container();

    Widget galloadingIndicator = _gallery_load ? new Container(
      color: Colors.white70,
      width: 100.0,
      height: 100.0,
      child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    ):new Container();

    Widget capturedImage = _isImageAvailable ? new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          // Image.file(_image),
          // Text(_text.toString()),
          Text('Deal submitted Successfully! { "Category ": "Electronics", "Product" : "iPhone 11"  }',
            style: TextStyle(fontSize:20,color: Colors.white, backgroundColor: Colors.green),
          )
        ],
      ),
    ):new Container(
      height: 50,
      width: 100,
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/amexlogo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Merchant Section - Add Deal'))
          ],
        ),
        centerTitle: true,
      ),

      body: new Material(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NiceButton(
                  width: 255,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "Capture Image",
                  icon: Icons.camera_alt,
                  background: firstColor,
                  onPressed: () async {
                    print("****Open camera for OCR recognition****");
                    setState(() {
                      _camera_load=true;
                    });
                    captureImage(true);
                  },
                ),
                new Align(child: camloadingIndicator,alignment: FractionalOffset.center,),
                new Align(child: capturedImage,alignment: FractionalOffset.center,),
                NiceButton(
                  radius: 40,
                  padding: const EdgeInsets.all(15),
                  text: "Upload from Gallery",
                  icon: Icons.file_upload,
                  gradientColors: [secondColor, firstColor],
                  background: secondColor,
                  onPressed: () async {
                    print("*****Access gallery*****");
                    // Navigator.pushNamed(context, '/merchant');
                    captureImage(false);
                    setState(() {
                      _gallery_load=true;
                    });
                  },
                ),
                new Align(child: galloadingIndicator,alignment: FractionalOffset.center,),
                NiceButton(
                  radius: 40,
                  padding: const EdgeInsets.all(15),
                  text: "Home",
                  icon: Icons.home,
                  gradientColors: [secondColor, firstColor],
                  background: firstColor,
                  onPressed: () {
                    print("*****Navigating to home*****");
                    Navigator.pushNamed(context, '/home');
                  },
                )
              ],
            ),
          ),

        ),


      ),

    );
  }



  Future<Text> captureImage(bool isCamera) async {
    File image;
    PickedFile pickedFile;
    print("In captureImage()...");

    final picker = ImagePicker();

    print("isCamera:"+isCamera.toString());

    print("===========================================================");
    print(picker);
    print("===========================================================");
    if (isCamera) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    Future<Text> _upload(PickedFile file) async {
      final String endPoint = 'http://192.168.1.121:8080/extract_text_from_image';
      String fileName = file.path
          .split('/')
          .last;
      print("filename=========>"+fileName);

      FormData data = FormData.fromMap({
        "document": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });

      Dio dio = new Dio();
      var jsonResponse;
      dio.post(endPoint, data: data).then((response) {
        jsonResponse = jsonDecode(jsonEncode(response.toString()));
        print(jsonResponse);

      }
      ).catchError((error) => print(error));

      return jsonResponse;
    }

    setState(() {
      _image = image;
      _text = Text(_upload(pickedFile).toString());
      _image = File(pickedFile.path);
      _isImageAvailable = true;
      _camera_load = false;
      _gallery_load = false;
    });
  }

}


// class Deals extends StatelessWidget{
//
//
//
// }

// class CaptureImage extends StatefulWidget{
//   @override
//   _UploadImageState createState() => _UploadImageState();
//
// }


// class _UploadImageState extends State<MaterialApp> {
//   File _image;
//   Text _text;
//
//   Future<Text> captureImage(bool isCamera) async {
//     File image;
//     PickedFile pickedFile;
//
//     final picker = ImagePicker();
//
//     if (isCamera) {
//       pickedFile = await picker.getImage(source: ImageSource.camera);
//     } else {
//       pickedFile = await picker.getImage(source: ImageSource.gallery);
//     }
//
//
//     Future<Text> _upload(File file) async {
//       final String endPoint = 'http://192.168.1.121:8080/test_api';
//       String fileName = file.path
//           .split('/')
//           .last;
//       print(fileName);
//
//       FormData data = FormData.fromMap({
//         "document": await MultipartFile.fromFile(
//           file.path,
//           filename: fileName,
//         ),
//       });
//
//       Dio dio = new Dio();
//       var jsonResponse;
//       dio.post(endPoint, data: data).then((response) {
//         jsonResponse = jsonDecode(jsonEncode(response.toString()));
//         print(jsonResponse);
//       }
//       ).catchError((error) => print(error));
//       return jsonResponse;
//     }
//
//
//     setState(() {
//       _text = Text(_upload(image).toString());
//       // _image = image;
//       // _image = File(pickedFile.path);
//     });
//   }
//
//
// }