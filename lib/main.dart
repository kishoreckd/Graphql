import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_api/homepage.dart';
// import 'package:moviereview/pages/homepage.dart';
// import 'package:moviereview/pages/MovieDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /***This init state is used to hide the status bar and below buttons */
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0XFF0F11)),
      routes: {
        // '/': (context) => Loading(),
        '/': (context) => Homepage(),
        // '/moviePage': (context) => MovieDetail(),
      },
    );
  }
}
