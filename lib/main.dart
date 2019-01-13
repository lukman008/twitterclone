import 'package:flutter/material.dart';

import 'package:twitter/pages/timeline.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override  
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Twitter',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(36,52,71,1.0)      
        ),
        home: Timeline(),
      );
    }
}
