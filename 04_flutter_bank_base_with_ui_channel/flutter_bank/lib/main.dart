import 'package:flutter/material.dart';
import 'package:flutter_bank/screen/add_account_info_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bank',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(247, 247, 247, 1),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(247, 247, 247, 1)),
      home: const AddAccountInfoScreen(),
    );
  }
}
