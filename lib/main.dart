import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/splash/splashscreen.dart';

const supabaseUrl = 'https://jddmwoebkyurjgerqyyg.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpkZG13b2Via3l1cmpnZXJxeXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4MzEyNzAsImV4cCI6MjAyNzQwNzI3MH0.R84BMrHwGOG1cHAEkB9wlITJki1Jev78ggj5A1AwNWs';

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demonstration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}


//  class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//    @override   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Supabase Flutter',
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Colors.green,
//      textButtonTheme: TextButtonThemeData(
//          style: TextButton.styleFrom(
//             foregroundColor: Colors.green,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//            foregroundColor: Colors.white,
//            backgroundColor: Colors.green,
//          ),
//         ),
//      ),
//       initialRoute: '/',
//       routes: <String, WidgetBuilder>{
//         '/': (_) => const SplashPage(),
//         '/login': (_) => const LoginPageWidget(),
//         '/account': (_) => const HomePageWidget(email: emailController, password: passwordController),
//      },
//    );
//   }

//   static of(BuildContext context) {}
// }