import 'package:flutter/material.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
         showModalBottomSheet(
           backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            isScrollControlled: true,
            useRootNavigator: true,
            enableDrag: false,
            isDismissible: true,
            context: context,
            builder: (BuildContext context) {
              DrawingController _dcontroller;
              _dcontroller = new DrawingController();
              _dcontroller.onChange().listen((draw){
               //do something with it
                });
              return Stack(
                  children: <Widget>[
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Whiteboard(
                     controller: _dcontroller,
                     )),
                     Positioned(
                       right: 1,
                       child: InkWell(
                       onTap: (){Navigator.pop(context);},
                       child: Padding(
                         padding: const EdgeInsets.all(12),
                         child: Icon(Icons.close, color: Colors.red, size: 30,),
                       ),),)
                  ],
                );
            });
      }),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container()
    );
  }
}
