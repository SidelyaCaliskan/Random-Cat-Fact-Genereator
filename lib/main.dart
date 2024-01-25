import 'package:flutter/material.dart';
import 'Screens/CatFatsScreen.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> caramelSwatch = {
  50: Color.fromRGBO(160, 82, 45, .1),
  100: Color.fromRGBO(160, 82, 45, .2),
  200: Color.fromRGBO(160, 82, 45, .3),
  300: Color.fromRGBO(160, 82, 45, .4),
  400: Color.fromRGBO(160, 82, 45, .5),
  500: Color.fromRGBO(160, 82, 45, .6),
  600: Color.fromRGBO(160, 82, 45, .7),
  700: Color.fromRGBO(160, 82, 45, .8),
  800: Color.fromRGBO(160, 82, 45, .9),
  900: Color.fromRGBO(160, 82, 45, 1),
};

MaterialColor customCaramelSwatch = MaterialColor(0xFFA0522D, caramelSwatch);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Cat Facts',
      theme: ThemeData(
        primarySwatch: customCaramelSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cat Fact Generator'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CatFactsScreen()),
          ),
          icon: Icon(Icons.casino),
          label: Text('Show me a cat fact!'),
        ),
      ),
    );
  }
}
