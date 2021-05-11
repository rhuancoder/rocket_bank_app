import 'package:flutter/material.dart';
import 'package:rocket_bank_app/screens/transfer/list.dart';

void main() => runApp(RocketBankApp());

class RocketBankApp extends StatelessWidget {
  const RocketBankApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan[900],
        accentColor: Colors.cyanAccent[700],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            primary: Colors.cyanAccent[700],
          ),
        ),
      ),
      home: TransfersList(),
    );
  }
}
