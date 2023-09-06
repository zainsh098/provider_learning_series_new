import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning_series/provider/home_provider.dart';
import 'package:provider_learning_series/screens/home_screen.dart';

void main() {



  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(create: (_)=> HomeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  HomeScreen(),
      ),

      );



  }
}

