import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  static const supabaseUrl = 'https://jddmwoebkyurjgerqyyg.supabase.co';
  static const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkZG13b2Via3l1cmpnZXJxeXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4MzEyNzAsImV4cCI6MjAyNzQwNzI3MH0.R84BMrHwGOG1cHAEkB9wlITJki1Jev78ggj5A1AwNWs';

  final supabase = SupabaseClient(supabaseUrl, supabaseKey);
  List<Map<String, dynamic>> testData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await supabase.rpc('login_test');

    if (response.error != null) {
      // Handle error
      print('Error fetching data: ${response.error?.message}');
    } else {
      // Update state with fetched data
      setState(() {
        testData = response.data as List<Map<String, dynamic>>;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Accounts'),
        elevation: 20.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Your welcome message and other UI elements
            // Example:
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome',
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
            // Display fetched data
            Expanded(
              child: ListView.builder(
                itemCount: testData.length,
                itemBuilder: (context, index) {
                  final item = testData[index];
                  return ListTile(
                    title: Text(item['fname'] ?? ''),
                    subtitle: Text(item['lname'] ?? ''),
                  );
                },
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
    );
  }
}
