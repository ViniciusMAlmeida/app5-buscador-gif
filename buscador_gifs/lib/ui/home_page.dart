import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _search = '';
  final int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == '') {
      response = await http.get(Uri.parse(
          'https://api.giphy.com/v1/gifs/trending?api_key=OWgWUOsrvh8H02UC9IPaTIOJBNww7bbv&limit=20&rating=g'));
    } else {
      response = await http.get(Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=OWgWUOsrvh8H02UC9IPaTIOJBNww7bbv&q=$_search&limit=20&offset=$_offset&rating=g&lang=en'));
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            'https://developers.giphy.com/static/img/dev-logo-lg.gif'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Pesquise Aqui',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}