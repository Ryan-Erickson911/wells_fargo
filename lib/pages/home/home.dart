import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../login/login.dart';

class HomePageWidget extends StatefulWidget {
  final String email;
  final String password;
  static const List pages = [];
  const HomePageWidget({super.key, required this.email, required this.password});
  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final supabase = Supabase.instance.client;
    
  Future<List<Map<String, dynamic>>> readData() async {
    List<Map<String, dynamic>>? res;
    res = await supabase.from('test').select().eq('username', widget.email).eq('pwrd', widget.password);
    return (res);
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
  int selectedIndex = 0;
  var size = MediaQuery.of(context).size;
  void onItemTapped(int index) {
  setState(() {
    selectedIndex = index;
   }
 );
}
  return Scaffold(
    backgroundColor: Colors.white,
    body: SizedBox(
      width: size.width,
      height: size.height,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: readData(), //<---
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: size.height,
                width: size.width,
                color: Colors.blueGrey,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              var email = snapshot.data![0]['username'];
              var fname = snapshot.data![0]['fname'];
              var lname = snapshot.data![0]['lname'];
              var investment = snapshot.data![0]['investment'];
              var balance = snapshot.data![0]['balance'];
              var collected = snapshot.data![0]['collected'];
              var expected = snapshot.data![0]['expected'];
              return Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.blueGrey.shade400],
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 1, color: Colors.blue.shade100),
                            ),
                          child: Container(
                            height: 100,
                            width: 100,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              ),
                            child: const Image(
                              image: AssetImage('assets/image.png'), // profile pic needs to be replaced with company logo 
                              fit: BoxFit.cover),
                          ),),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Welcome Back, $fname $lname",
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            email,
                            style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: size.width,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(5)),
                          child: const Text('Account Information',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: size.width,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Current Balance:',
                                style: TextStyle(
                                  fontSize: 16, color: Colors.black)),
                              const SizedBox(height: 7),
                            Text(balance,
                                    style: const TextStyle(
                                        fontSize: 19, color: Colors.black)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Total Amount Collected:',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                const SizedBox(height: 7),
                                Text(collected,
                                    style: const TextStyle(
                                        fontSize: 19, color: Colors.black)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Investment Value:',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                const SizedBox(height: 7),
                                Text(investment,
                                    style: const TextStyle(
                                        fontSize: 19, color: Colors.black)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Expected Amount (Add Expected Date?):', //testing long string -> remove question for demo
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black)),
                                const SizedBox(height: 7),
                                Text(expected,
                                    style: const TextStyle(
                                        fontSize: 19, color: Colors.black)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                             onPressed: () async {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginPageWidget()));
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.redAccent.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25)),
                            child: const Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                    ]),
                  ),
                )
                );
              } // Ifelse
            } else {
              debugPrint(snapshot.error.toString());
              }
              return const SizedBox();},
        )
      ),
    bottomNavigationBar: BottomNavigationBar(
      key: ,
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          key: ,
          icon: Icon(Icons.home),
          label: 'Home',
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
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
      ),
    );
  }
}