import 'package:flutter/material.dart';

class ModeScreen extends StatefulWidget {
  const ModeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

ThemeData _darkTheme = ThemeData.dark();
ThemeData _lightTheme = ThemeData.light();
bool _light = true;

class _ModeScreenState extends State<ModeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => Navigator.pop(context)),
          centerTitle: true,
          backgroundColor: Colors.teal.shade800,
          title: const Text('Mode'),
        ),
        body: SafeArea(
          child: Switch(
            inactiveThumbColor: Colors.pinkAccent,
            value: _light,
            onChanged: (state) {
              setState(() {
                _light = state;
              });
            },
          ),
        ),
      ),
    );
  }
}
