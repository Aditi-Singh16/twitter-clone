import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/screens/home/profile.dart';
import 'package:twitter_clone/screens/home/spaces.dart';
import 'package:twitter_clone/screens/home/spacesForm.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans'
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>MyHomePage(),
        '/profile':(context)=>Profile(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool showProfile = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }



  static const _widgetOptions = <Widget>[
    Text('home'),
    Text(
        'search'
    ),
    TwitterSpaces(),
    Text(
        'Notification'
    ),
    Text(
      'Mail',
    ),
  ];

  void _showForm(BuildContext context){
     showModalBottomSheet(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(30.0),
             topRight: Radius.circular(30.0)
         ),
       ),
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (context)=> SpacesForm()
    );
  }

  @override
  Widget build(BuildContext context) {

    var _widgetAppbar = <Widget>[
      AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){
                Navigator.pushNamed(context, '/profile');
            },
            icon: Icon(FontAwesomeIcons.user,color:Colors.black),
          ),
          Spacer(),
          Icon(FontAwesomeIcons.twitter,color:Colors.blue,size:30),
          Spacer(),
          IconButton(
            onPressed: null,
            icon: Icon(FontAwesomeIcons.handSparkles,color:Colors.black),
          ),

        ],
      ),
      AppBar(
        elevation: 0.4,
        title: Text('Search'),
        leading: Icon(Icons.person_sharp,color:Colors.black),
      ),
      AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: Text('Spaces',style: TextStyle(
            color: Colors.black,
            letterSpacing: 0.6,
            fontSize: 20
        ),),
        leading: Icon(Icons.person_sharp,color:Colors.black),
      ),
      AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: Text('Notifications'),
        leading: Icon(Icons.person_sharp,color:Colors.black),
      ),
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: Text('Mail'),
        leading: Icon(Icons.person_sharp,color:Colors.black),
      ),

    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: _widgetAppbar.elementAt(_selectedIndex),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home,
              color: Colors.black,
              size: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.search,
              color: Colors.black,
              size: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.workspaces_filled,
              color: Colors.black,
              size: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.notifications,
              color: Colors.black,
              size: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.mail_outline,
                color: Colors.black,
              size: 25
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(
          size: 25,
          color: Colors.black
        ),
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),
        tooltip: 'Create Space',
        child: Icon(Icons.workspaces_filled),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
