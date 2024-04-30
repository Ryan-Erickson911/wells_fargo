import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../splash/splashscreen.dart';

class HomePageWidget extends StatefulWidget {
  final String email;
  final String password;
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
    Widget build(BuildContext context,) {
      var size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          title: const Image(
            image: AssetImage('assets/images/smallslogan.png'), // profile pic needs to be replaced with company logo 
            fit: BoxFit.cover
          ),
          backgroundColor: Colors.blue,
          shape: const Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
              ),
              ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Handle item 1 tap
          },
              ),
              ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Handle item 2 tap
          },
              ),
            ListTile(
        title: TextButton(
          onPressed: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              ),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.redAccent.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15, 
              horizontal: 25,
            ),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
              // Add more ListTile widgets for additional menu items
            ],
          ),
        ),
        backgroundColor: Colors.blue,
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
                    color: Colors.blue,
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
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(height: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome Back, $fname $lname",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  email,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 20),
                            const Text('Account Information',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                            const Divider(
                              color: Colors.white, 
                              height: 20, 
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Current Balance',
                                    style: TextStyle(
                                      fontSize: 20, color: Colors.blue)
                                    ),
                                  const Divider(
                                    color: Colors.blue, 
                                    height: 20, 
                                  ),
                                  const SizedBox(height: 7),
                                  Center(
                                    child: Text(balance,
                                      style: const TextStyle(
                                        fontSize: 19, color: Colors.blue)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total Amount Collected',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.blue,
                                    height: 20,
                                  ),
                                  const SizedBox(height: 7),
                                  Center(
                                    child: Text(
                                      collected,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Investment Value',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue)
                                          ),
                                  const Divider(
                                    color: Colors.blue, 
                                    height: 20, 
                                  ),
                                  const SizedBox(height: 7),
                                  Center(
                                    child: Text(investment,
                                      style: const TextStyle(
                                          fontSize: 19, color: Colors.blue)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Expected Amount', //testing long string -> remove question for demo
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue)
                                          ),
                                  const Divider(
                                    color: Colors.blue, 
                                    height: 20, 
                                  ),
                                  const SizedBox(height: 7),
                                  Center(
                                    child: Text(expected,
                                      style: const TextStyle(
                                          fontSize: 19, color: Colors.blue)),
                                  ),
                                ],
                              ),
                            ),
                            ],
                        ),
                      ),
                    )
                  );
                } // Ifelse
              } else {
                debugPrint(snapshot.error.toString());
              }
              return const SizedBox();
            },
          ),
        ),
      );
    }
  }
