import 'package:flutter/material.dart';
import 'package:task/screens/pooker_screen.dart';
// import 'package:flutter/services.dart';

void main() {
  // void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  /// 🔒 Force Landscape Mode
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight,
  // ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      debugShowCheckedModeBanner: false,
      home: PokerScreen(),
    );
  }
}
