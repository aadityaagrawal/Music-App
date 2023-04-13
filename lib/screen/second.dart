import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  var value = "";
  secondPage({required this.value, super.key});

  @override
  State<secondPage> createState() => _secondPageState(value: value);
}

class _secondPageState extends State<secondPage> {
  var value = "";
  var answer = "";
  var trackName = "";
  _secondPageState({required this.value});

  void fetchURL() async {
    String apiURL =
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$value&apikey=dd26d3458e7aefc2fd2c190014db04f1";

    String apiURL1 =
        "https://api.musixmatch.com/ws/1.1/track.get?track_id=$value&apikey=dd26d3458e7aefc2fd2c190014db04f1";
    final uri = Uri.parse(apiURL);
    final uri1 = Uri.parse(apiURL1);
    final response = await http.get(uri);
    final response1 = await http.get(uri1);
    final body1 = response1.body;
    final json1 = jsonDecode(body1);
    trackName = json1["message"]["body"]["track"]["track_name"];
    final body = response.body;
    final json = jsonDecode(body);
    answer = json["message"]["body"]["lyrics"]["lyrics_body"];
    setState(() {});
  }

  @override
  void initState() {
    fetchURL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Lyrics",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green[300],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    trackName,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ),
            Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: const Text(
                  "Lyrics::",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                )),
            Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(answer)),
          ],
        ));
    ;
  }
}
