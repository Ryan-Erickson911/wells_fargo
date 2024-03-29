import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'data.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';
import 'page6.dart';

Future<void> main() async {
  await dotenv.load(fileName: "test.env");
  runApp(const MainApp());
}

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final DatabaseService dbService = DatabaseService();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  } 
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } 
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final username = _username.text;
                    final password = _password.text;
                    // Store the context
                    final currentContext = context;
                    final databaseService = DatabaseService();
                    final userData = await databaseService.fetchData(username, password);
                    if (userData.isNotEmpty) {
                    Navigator.push(
                        currentContext,
                        MaterialPageRoute(
                          builder: (context) => DashboardPage(userData: username, key: password,),
                        ),
                      );
                    } else {
                      // Show error message for invalid username/password
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid username or password')),
                      );
                    }
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DashboardPage extends StatelessWidget {
  DashboardPage({required Key key, required Map<String, dynamic> userData}) : super(key: key);

  final List<String> buttonTexts = ['Page 1', 'Page 2', 'Page 3', 'Page 4', 'Page 5', 'Page 6'];
  final List<String> datatext = ['Data 1', 'Data 2', 'Data 3', 'Data 4', 'Data 5', 'Data 6'];
  final List<Widget> pages = [const Page1(), const Page2(), const Page3(), const Page4(), const Page5(), const Page6()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(20.0),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: List.generate(6, (index) {
          return Card(
            color: Colors.blue[900],
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pages[index]),);
                    },
                    child: Text(
                      buttonTexts[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.white,
                    child: Text(
                      datatext[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
      ),
    );
  }
}

class MainApp extends StatelessWidget {
    const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue[900],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(key: const Key('dashboard'), userData: const {},),
      },
    );
  }
}
