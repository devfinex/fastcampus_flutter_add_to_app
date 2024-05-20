import 'package:flutter/material.dart';
import 'package:flutter_bank/screen/add_account_identification_screen.dart';
import 'package:flutter_bank/screen/add_account_info_screen.dart';
import 'package:flutter_bank/screen/add_account_result_screen.dart';
import 'package:flutter_boost/flutter_boost.dart';

void main() {
  CustomFlutterBinding();
  runApp(const MyApp());
}

class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Map<String, FlutterBoostRouteFactory> routerMap = {
    '/': (settings, uniqueId) {
      return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const AddAccountInfoScreen());
    },
    'identification': (setting, uniqueId) {
      Map<dynamic, dynamic>? arguments =
          setting.arguments as Map<dynamic, dynamic>?;
      String accountNo = arguments?['accountNo'] ?? '';

      return PageRouteBuilder(
          settings: setting,
          pageBuilder: (_, __, ___) =>
              AddAccountIdentificationScreen(accountNo: accountNo));
    },
    'result': (setting, uniqueId) {
      Map<dynamic, dynamic>? arguments =
          setting.arguments as Map<dynamic, dynamic>?;
      String accountNo = arguments?['accountNo'] ?? '';

      return PageRouteBuilder(
          settings: setting,
          pageBuilder: (_, __, ___) =>
              AddAccountResultScreen(accountNo: accountNo));
    }
  };

  Route<dynamic>? routeFactory(RouteSettings? settings, String? uniqueId) {
    if (settings == null) {
      return null;
    }
    var func = routerMap[settings.name];
    return func == null ? null : func(settings, uniqueId);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bank',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(247, 247, 247, 1),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(247, 247, 247, 1)),
      home: home,
    );
  }
}
