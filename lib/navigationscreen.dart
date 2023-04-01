import 'package:new_code_wid_f/reachus.dart';
import 'package:flutter/material.dart';
import 'package:new_code_wid_f/profile.dart';
import 'package:new_code_wid_f/homescreen.dart';
import 'package:new_code_wid_f/reachus.dart';

void main() => runApp(const NavigationScreen());

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  static const String _title = 'VIIT BLOG';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[ HomeScreen(),Profile(),ReachUs()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.pink,
      //   title:  Text(' VIIT Blog ',textAlign: TextAlign.center),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          //const bonavbar
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Feedback',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          // switch (index) {
          //   case 0:
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => HomeScreen()));
          //     break;
          //   case 1:
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => Profile()));
          //         break;
          //   case 2:
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => ReachUs()));
          //     break;
          // }
          setState(
                () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Example Dialog'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void showModal1(BuildContext context) {
    Widget _listViewBody() {
      return ListView.separated(
          controller: _homeController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Text(
                'Item $index',
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1,
          ),
          itemCount: 50);
    }
  }
}
