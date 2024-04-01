import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

@override
  _AccountPageState createState() => _AccountPageState();
}


class _AccountPageState extends State<AccountPage> {
  static const supabaseUrl = 'https://jddmwoebkyurjgerqyyg.supabase.co';
  static const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkZG13b2Via3l1cmpnZXJxeXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4MzEyNzAsImV4cCI6MjAyNzQwNzI3MH0.R84BMrHwGOG1cHAEkB9wlITJki1Jev78ggj5A1AwNWs';
  final supabase = SupabaseClient(supabaseUrl, supabaseKey);
  List testData = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final myQuery = supabase.from('test').select();
    final response = await myQuery.eq('username', 'email3@some.com');

    print(response);
    if (response.isEmpty) {
      //Handle error
      throw 'Error fetching data';
    } else {
      //Update state with fetched data
      setState(() {
        testData = response.toList() as List;
      });
    }
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Center(child: Text('Account', style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        body: Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.grey[900]!, Colors.grey[300]!],
    ),
  ),
  child: Center(
    child: Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Add top padding
        child: Column(
          children: [
            Text('Welcome Back, Mia Johnson', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue[900])),
            const Text('Account Info/Overview', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            Container(
              width: double.infinity,
<<<<<<< HEAD
              margin: const EdgeInsets.only(top: 40.0), // Add top margin
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Balance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                    const Divider(color: Colors.grey),
                    Text('100.00', style: TextStyle(fontSize: 20, color: Colors.blue[900])),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 40.0), // Add top margin
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
=======
              padding: const EdgeInsets.all(8.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome Mia Johnson',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                      
                    ),
                  ),
                  
>>>>>>> 424353d357d143bdb55233ce36e6c34065adaa5f
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Investment', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                    const Divider(color: Colors.grey),
                    Text('500.00', style: TextStyle(fontSize: 20, color: Colors.blue[900])),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 40.0), // Add top margin
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expected', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                    const Divider(color: Colors.grey),
                    Text('120.00', style: TextStyle(fontSize: 20, color: Colors.blue[900])),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 40.0), // Add top margin
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Collected', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                    const Divider(color: Colors.grey),
                    Text('120.00', style: TextStyle(fontSize: 20, color: Colors.blue[900])),
                  ],
                ),
              ),
            ),
<<<<<<< HEAD
=======
<<<<<<< HEAD
            // Display fetched data
            Expanded(
              child: ListView.builder(
                itemCount: testData.length,
                itemBuilder: (context, index) {
                  final item = testData[index];
                  return ListTile(
                    title: Text(item['fname']),
                    subtitle: Text(item['lname']),
                  );
                },
              ),
            ),
          Container(
      margin: const EdgeInsets.all(8.0), // Add margin around the widget
      child: const Card(
        elevation: 5.0, // Raise the border of the widget
        child: SizedBox(
          width: double.infinity, // Make the widget fill the width of the screen
          height: 100, // Set the height of the widget
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Top Left Text'), // Text box aligned to the top left
                Text('Bottom Left Text'), // Text box aligned to the bottom left
              ],
            ),
          ),
        ),
      ),
    ),
        Container(
      margin: const EdgeInsets.all(8.0), // Add margin around the widget
      child: const Card(
        elevation: 5.0, // Raise the border of the widget
        child: SizedBox(
          width: double.infinity, // Make the widget fill the width of the screen
          height: 100, // Set the height of the widget
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Top Left Text'), // Text box aligned to the top left
                Text('Bottom Left Text'), // Text box aligned to the bottom left
              ],
            ),
          ),
        ),
      ),
    ),
        Container(
      margin: const EdgeInsets.all(8.0), // Add margin around the widget
      child: const Card(
        elevation: 5.0, // Raise the border of the widget
        child: SizedBox(
          width: double.infinity, // Make the widget fill the width of the screen
          height: 100, // Set the height of the widget
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Top Left Text'), // Text box aligned to the top left
                Text('Bottom Left Text'), // Text box aligned to the bottom left
              ],
            ),
          ),
        ),
      ),
    ),
        Container(
      margin: const EdgeInsets.all(8.0), // Add margin around the widget
      child: const Card(
        elevation: 5.0, // Raise the border of the widget
        child: SizedBox(
          width: double.infinity, // Make the widget fill the width of the screen
          height: 100, // Set the height of the widget
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Top Left Text'), // Text box aligned to the top left
                Text('Bottom Left Text'), // Text box aligned to the bottom left
              ],
            ),
          ),
        ),
      ),
    ),
=======
            // // Display fetched data
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: testData.length,
            //     itemBuilder: (context, index) {
            //       final item = testData[index];
            //       return ListTile(
            //         title: Text(item['fname']),
            //         subtitle: Text(item['lname']),
            //       );
            //     },
            //   ),
            // ),
>>>>>>> 22017980fc782c0b458ff789140f1bba0dfa33b5
>>>>>>> 424353d357d143bdb55233ce36e6c34065adaa5f
          ],
        ),
      ),
    ),
  ),
),
bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Account',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'Map',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.newspaper),
        label: 'Documents',
      ),
    ],
  ),
      ),
    );
  }
}