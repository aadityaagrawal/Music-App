import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'second.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  dynamic users;
  var songName = [];
  var artistName = [];
  var trackId = [];

  void fetchURL() async {
    const apiURL =
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=dd26d3458e7aefc2fd2c190014db04f1";

    final uri = Uri.parse(apiURL);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["message"]["body"]["track_list"];
      users.forEach((element) => {
            if (element["track"]["has_lyrics"] == 1)
              {
                songName.add(element["track"]["track_name"]),
                artistName.add(element["track"]["artist_name"]),
                trackId.add(element["track"]["track_id"])
              }
          });
    });
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
          "Music Library",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => secondPage(value: trackId[index].toString()),
                  ));
            },
            child: ListTile(
              leading: const Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30.0,
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                size: 30.0,
              ),
              title: Text(songName[index]),
              subtitle: Text(artistName[index]),
            ),
          );
        },
        itemCount: songName.length,
      ),
    );
  }
}
