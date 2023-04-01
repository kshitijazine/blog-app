
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          title: Text("API Demo"),
          backgroundColor: Colors.pink,
        ), // AppBar

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


  }
}


