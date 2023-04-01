/**********
    import 'package:flutter/material.dart';

    class HomeScreen extends StatefulWidget {
    @override
    _homescreenState createState() => _homescreenState();
    }



    class _homescreenState extends State<HomeScreen> {
    @override
    Widget build(BuildContext context) {
    return new Scaffold(
    appBar:  new AppBar(
    title: new Text("Homescreen"),
    ),
    body:new Center(
    child: new Text("This is home page" )
    )
    );
    }
    }
 */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ); // MaterialApp
  }
}


String stringResponse= '';
Map mapResponse = {};
Map dataResponse = {};
List listResponse = [];

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);                    //string map
        listResponse=  mapResponse['data'];
      });
    }
  }
  @override
  void initState() {
    apicall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("VIIT Blog"),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ), // AppBar
        /**body: ListView.builder(
            itemBuilder: (context,index){
            // ...
            },
            itemCount: listResponse == null? 0: listResponse.length,
            )

            body: ListView.builder( itemBuilder: (context,index){
            return container(
            child:column(
            children: [
            padding(
            padding:const EdgeInsects.all(8.0),
            child:Image.network(listResponse[index]['avatar']), //wrap with padding
            },
            itemCount: listResponse == null? 0: listResponse.length,
            )
            ),
            Text(listResponse[index]['id'].toString()),                        two {{
            Text(listResponse[index]['email'].toString()),
            Text(listResponse[index]['first_name'].toString()),
            Text(listResponse[index]['last_name'].toString()),

            ],
            ),
            );
            }, ******/
        //copied code
        body: ListView.builder(itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(listResponse[index]['avatar']), //wrap with padding
                ),
                Text(listResponse[index]['id'].toString()),
                Text(listResponse[index]['email'].toString()),
                Text(listResponse[index]['first_name'].toString()),
                Text(listResponse[index]['last_name'].toString()),
              ],
            ),
          );
        },
          itemCount: listResponse == null ? 0 : listResponse.length,
        ));

    /****
        child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.blue), //
        child: Center(
        itemCount: listResponse == null? 0: listResponse.length,
        //Container(): Text(dataResponse['text'].toString()),
        )); // Center*/
  }
}




