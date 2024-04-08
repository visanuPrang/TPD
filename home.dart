// ignore_for_file: unused_local_variable, unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tpd/room_list.dart';
import 'package:tpd/variables.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'T.P.D. Apartment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 6, 119),
        title: Text(
          ' ${widget.title} ',
          style: const TextStyle(
              fontStyle: FontStyle.italic,
              letterSpacing: 2.0,
              fontFamily: 'PK_Uttaradit',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 247, 225, 202)),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        transformAlignment: Alignment.bottomCenter,
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.3), BlendMode.dstIn),
              image: const AssetImage('assets/images/TPDBackground.png'),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              margin: const EdgeInsets.only(bottom: 15),
              padding:
                  const EdgeInsets.only(left: 25, right: 25, bottom: 5, top: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffad9c00),
                  width: 3.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                gradient: const LinearGradient(
                  colors: [Colors.yellow, Color(0xffad9c00)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const RoomList()),
                  );
                },
                child: const Row(
                  children: [
                    Icon(Icons.apartment_outlined),
                    Text(
                      '  ข้อมูลห้องเช่า',
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontFamily: 'PK_Uttaradit',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 82, 74, 5)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding:
                  const EdgeInsets.only(left: 25, right: 25, bottom: 5, top: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffad9c00),
                  width: 3.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                gradient: const LinearGradient(
                  colors: [Colors.yellow, Color(0xffad9c00)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.room_preferences_outlined),
                  Text(
                    '  ตั้งค่า',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 1.0,
                        fontFamily: 'PK_Uttaradit',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 74, 5)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.08,
        color: const Color.fromARGB(255, 161, 176, 198),
        child: Text(
          'T.P.D. Apartment Application. ${variables.passVersion}\nCopyright ©2024, All Rights Reserved.',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
              color: Color.fromARGB(255, 1, 16, 37)),
        ),
      ),
    );
  }
}
