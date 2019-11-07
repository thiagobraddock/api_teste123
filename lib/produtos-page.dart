import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Produtos extends StatefulWidget {
  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  Map<String, dynamic> data;
  var isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(
        Uri.encodeFull("http://hardtec.ga/api/lista-post.php"),
        headers: {"Accept": "Application/json"});
    if (response.statusCode == 200) {
      this.setState(() {
        data = json.decode(response.body);
        print(data);
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data == null ? 0 : data['posts'].length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Text("${data['posts'][index]['nome']}"),
                    ],
                  )),
                );
              }),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
}
