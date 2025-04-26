import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncspace/resource/auth_method.dart';
import 'package:syncspace/screens/home_screen.dart';
import 'package:syncspace/screens/login_screens.dart';
import 'package:syncspace/screens/video_call_screen.dart';
import './utils/colours.dart' show backgroundColor;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  // try {
  //   await Firebase.initializeApp();
  //   runApp(const MyApp());
  // } catch (e) {
  //   print("Error initializing Firebase: $e");
  //   runApp(const MaterialApp(home: Scaffold(body: Center(child: Text('Error initializing Firebase')))));
  // }

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyC4lRVh_WsLGwqnuadinw3pQckHrR-MLfM",
              appId: "1:495764952077:android:dd93bc8578be6a22463144",
              messagingSenderId: "495764952077",
              projectId: "zoom-clone-f2b90"))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video-call': (context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
          stream: AuthMethods().authChange,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),
              );
            }
            if(snapshot.hasData){
              return const HomeScreen();
            }
            return const LoginScreen();
          }
      )
    );
  }
}
