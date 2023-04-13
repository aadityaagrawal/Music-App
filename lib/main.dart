import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screen/test.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String apiUrl =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=dd26d3458e7aefc2fd2c190014db04f1";

  String? answer;

  void _loadTracks() async {
    final response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      setState(() {
        answer = responseBody["track_list"][0];
      });
    } else {
      print("Error: ${response.statusCode} ${response.reasonPhrase}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Testing(),
    );
  }
}
