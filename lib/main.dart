import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/provider/provider.dart';
import 'package:student_app_provider/screens/myHomePage.dart';
import 'package:student_app_provider/screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentDetailsProvider(), child: SearchPage(),),
        ChangeNotifierProvider(create: (_) => StudentImageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student app using Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}