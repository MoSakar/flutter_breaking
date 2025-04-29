import 'package:flutter/material.dart';
import 'package:flutter_breaking/routs.dart';

void main() {
  runApp(MyApp(appRoute: AppRoute()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRoute});
  final AppRoute appRoute ;
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRoute.generateRoute,
      
    );
  }
}


