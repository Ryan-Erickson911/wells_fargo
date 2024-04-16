import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../splash/splashscreen.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import '../map/place_tracker_app.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      navigatorKey:  _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(
            child: ScaffoldWithNavigationBar(
          location: state.uri.toString(),
          child: child,
        ));
      },
      routes: [
        GoRoute(
          path:'/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: HomePageWidget(email: 'email', password: 'password')
            );
          },
        ),
        GoRoute(
          path:"/map",
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
                child: PlaceTrackerApp(),
              ),               
            ),
        GoRoute(
          path:'/docs',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => const NoTransitionPage(
              child: SplashScreen()),
          ),
      ],
    ),
  ],
);

class HomePageWidget extends StatefulWidget {
  final String email;
  final String password;
  const HomePageWidget({super.key, required this.email, required this.password});
  // private navigators

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final supabase = Supabase.instance.client;
  final router = goRouter;

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
    key: scaffoldKey,
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
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 100,
                            width: 350,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              ),
                            child: const Image(
                              image: AssetImage('assets/images/smallslogan.png'), // profile pic needs to be replaced with company logo 
                              fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 10),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text(
                            "Welcome Back, $fname $lname",
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                                color: Colors.grey, 
                                height: 20, 
                                ),
                            Text(
                            email,
                            style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          ),
                      ],
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
                          child: const Text('Account Information:',
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
                                  fontSize: 16, color: Colors.black)
                                  ),
                                const Divider(
                                color: Colors.grey, 
                                height: 20, 
                                ),
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
                                        fontSize: 16, color: Colors.black)
                                        ),
                                const Divider(
                                color: Colors.grey, 
                                height: 20, 
                                ),
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
                                        fontSize: 16, color: Colors.black)
                                        ),
                                  const Divider(
                                color: Colors.grey, 
                                height: 20, 
                                ),
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
                                        fontSize: 16, color: Colors.black)
                                        ),
                                const Divider(
                                color: Colors.grey, 
                                height: 20, 
                                ),
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
                                          const SplashScreen()));
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
    );
  }
}

// ignore: must_be_immutable
class ScaffoldWithNavigationBar extends StatefulWidget {
  String location;
  ScaffoldWithNavigationBar({super.key, required this.child, required this.location});
  final Widget child;

   @override
  State<ScaffoldWithNavigationBar> createState() => _ScaffoldWithNavBarState(); 
}
class _ScaffoldWithNavBarState extends State<ScaffoldWithNavigationBar> {
  int _currentIndex = 0;

  static const List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: 'HOME',
      initialLocation: '/',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.map_outlined),
      activeIcon: Icon(Icons.map),
      label: 'MAPS',
      initialLocation: '/maps',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.list_alt_outlined),
      activeIcon: Icon(Icons.list_alt),
      label: 'DOCS',
      initialLocation: '/docs',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(fontFamily: 'Roboto');
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        selectedItemColor: const Color(0xFF434343),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFF838383),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _goOtherTab(context, index);
        },
        currentIndex: widget.location == '/'
            ? 0
            : widget.location == '/maps'
                ? 1
                : widget.location == '/docs'
                ? 2
                : 3,
        items: tabs,
      ),
    );
  }

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;

    setState(() {
      _currentIndex = index;
    });
  router.go(location);
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
      required super.icon,
      super.label,
      Widget? activeIcon})
      : super(activeIcon: activeIcon ?? icon);
}
