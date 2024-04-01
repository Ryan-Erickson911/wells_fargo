import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client.rpc('login_test');
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