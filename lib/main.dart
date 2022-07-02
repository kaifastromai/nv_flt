import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Route generate(RouteSettings settings) {
    Route page;
    switch (settings.name) {
      case "/":
        page = PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation, Animation<double> secondaryAnimation) {
          return Text("Home");
        });

        break;
      default:
        page = PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation, Animation<double> secondaryAnimation) {
          return Text("404");
        });
        break;
    }
    return page;
  }

  // This widget is the root of your application.?
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
        color: Colors.blue, initialRoute: "/", onGenerateRoute: generate);
  }
}
