import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/SpeedOMeter.dart';
import 'components/ScrollColumn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

  static _MainAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MainAppState>();
}

class _MainAppState extends State<MainApp> {
  // bool col2Box = true;
  bool col3Box = false;
  bool colVisiblity = true;
  bool _fullScreen = false;
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              width: 915,
              height: 412,
              color: Colors.black87,
              child: Row(
                children: [
                  SpeedOMeterWidget(
                      visiblity: true,
                      fullScreenMode:_fullScreen? (value) {
                        _timer = new Timer(const Duration(milliseconds: 250), () {
                          setState(() => _fullScreen = value);
                        });
                      }: (value) => setState(() => _fullScreen = value)),
                  ScrollColumn(
                    colVisiblity: !_fullScreen,
                    fullScreenSpeedo: _fullScreen,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
