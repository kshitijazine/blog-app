import 'package:flutter/material.dart';
void main() {
  runApp(const Profile());
}
class Profile extends StatelessWidget {
  const Profile ({super.key});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: ''),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [
                  const Color(0xFFF48FB1),
                  const Color(0xFFF48FB1),
                ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          new Scaffold(
            // appBar: AppBar(
            //   leading: IconButton(
            //     icon: Icon(Icons.arrow_back, color: Colors.black),
            //     onPressed: () => Navigator.of(context).pop(),
            //   ),
            // ),

            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text('Profile'),
            ),
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.center,
                    child: new Padding(
                      padding: new EdgeInsets.only(top: _height / 15),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          new CircleAvatar(
                            backgroundImage: new AssetImage('assets/images/profile.png'),
                            radius: _height / 10,
                          ),
                          new SizedBox(
                            height: _height / 30,
                          ),
                          new Text(
                            'Kshitija Zine',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),

                  new Padding(
                    padding: new EdgeInsets.only(top: _height / 2.2),
                    child: new Container(
                      color: Colors.white,
                    ),
                  ),
                  new Padding(

                    padding: new EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20),

                    child: new Column(
                      children: <Widget>[

                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 10),
                          child: new Column(
                            children: <Widget>[
                              infoChild(
                                  _width, Icons.email, 'kshitijazine@gmail.com'),
                              infoChild(_width, Icons.call, '+91 9075800340'),
                              infoChild(_width, Icons.chat,
                                  'Kshitija Zine'),
                              new Padding(
                                padding: new EdgeInsets.only(top: _height / 30),
                                child: new Container(
                                  width: _width / 3,
                                  height: _height / 20,
                                  decoration: new BoxDecoration(
                                      color: const Color(0xFFF48FB1),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(_height / 40)),
                                      boxShadow: [
                                        new BoxShadow(
                                            color: Colors.black87,
                                            blurRadius: 2.0,
                                            offset: new Offset(0.0, 1.0))
                                      ]),
                                  child: new Center(
                                    child: new Text('submit',
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),

                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerChild(String header, int value) => new Expanded(
      child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: new TextStyle(
                fontSize: 14.0,
                color: const Color(0xFFF48FB1),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => new Padding(
    padding: new EdgeInsets.only(bottom: 8.0),
    child: new InkWell(
      child: new Row(
        children: <Widget>[
          new SizedBox(
            width: width / 10,
          ),
          new Icon(
            icon,
            color: const Color(0xFFF48FB1),
            size: 36.0,
          ),
          new SizedBox(
            width: width / 20,
          ),
          new Text(data)
        ],
      ),
      onTap: () {
        print('Info Object selected');
      },
    ),
  );
}



