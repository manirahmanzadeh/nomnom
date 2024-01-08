import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nomnom/src/screens/foods/foods_screen.dart';
import 'package:nomnom/src/screens/splash/splash_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    tools: [
      ...DevicePreview.defaultTools
    ],
    builder: (context) => App() // Wrap your app
  )
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
