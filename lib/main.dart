import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import '/pages/login.dart';
const supabaseUrl = 'https://jddmwoebkyurjgerqyyg.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkZG13b2Via3l1cmpnZXJxeXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4MzEyNzAsImV4cCI6MjAyNzQwNzI3MH0.R84BMrHwGOG1cHAEkB9wlITJki1Jev78ggj5A1AwNWs';

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

////////////////Should try to make main page look like this for navigation///////////////////////
///
 class MyApp extends StatelessWidget {
  const MyApp({super.key});
   @override   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
     textButtonTheme: TextButtonThemeData(
         style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
           foregroundColor: Colors.white,
           backgroundColor: Colors.green,
         ),
        ),
     ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        //'/': (_) => const SplashPage(),
        //'/login': (_) => const LoginPage(),
        '/account': (_) => const AccountPage(),
     },
   );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text('Accounts'),
          elevation: 20.0
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
           Container(
              margin: const EdgeInsets.only(bottom: 150.0), 
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: const Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      'Welcome back, First Name Last Name',
                       style: TextStyle(
                      fontSize: 28.0, 
                      fontWeight: FontWeight.bold, 
            ),
          ),
          Text(
            'Account Info/Overview.',
            style: TextStyle(
              fontSize: 18.0, 
            ),
          ),
        ],
      ),
    ),
  
),
             Container(
  margin: const EdgeInsets.symmetric(vertical: 10.0), // add top and bottom margins
  child: Card(
    elevation: 5.0,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    const Text(
      'Cash Balance',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Container(
      margin: const EdgeInsets.only(top: 10.0), // add top margin
      child: const Text(
        'Value from SQL Server',
        style: TextStyle(
          fontSize: 24.0, // larger font size
          fontWeight: FontWeight.bold, // bolder font
        ),
      ),
    ),
  ],
),
        ],
      ),
    ),
  ),
),
              Container(
  margin: const EdgeInsets.symmetric(vertical: 10.0), // add top and bottom margins
  child: Card(
    elevation: 5.0,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    const Text(
      'Investment Amount',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Container(
      margin: const EdgeInsets.only(top: 10.0), // add top margin
      child: const Text(
        'Value from SQL Server',
        style: TextStyle(
          fontSize: 24.0, // larger font size
          fontWeight: FontWeight.bold, // bolder font
        ),
      ),
    ),
  ],
),
        ],
      ),
    ),
  ),
),
            Container(
  margin: const EdgeInsets.symmetric(vertical: 10.0), // add top and bottom margins
  child: Card(
    elevation: 5.0,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    const Text(
      'Expected Monthly Income',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    Container(
      margin: const EdgeInsets.only(top: 10.0), // add top margin
      child: const Text(
        'Value from SQL Server',
        style: TextStyle(
          fontSize: 24.0, // larger font size
          fontWeight: FontWeight.bold, // bolder font
        ),
      ),
    ),
  ],
),
        ],
      ),
    ),
  ),
),
  
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Documents',
            ),
          ],
          elevation: 20.0,
        ),
      ),
    );
  }
}