import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _preco = "0";

    void _RecuperarPreco () async{
      String url = "https://blockchain.info/ticker";
      http.Response response = await http.get(url);

      Map<String, dynamic> retorno = json.decode(response.body);
        setState(() {
          _preco = (retorno["BRL"]["buy"].toString());
        });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/bitcoin.png"),
              Padding(
                  padding:EdgeInsets.only(top: 60, bottom: 30),
                child: Text(
                  // '\' CAractere de Escape
                    "R\$ " + _preco,
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),

              RaisedButton(
               padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                      Icon(
                        Icons.autorenew,
                        color: Colors.white,
                        size: 28,
                      ),

                    Text(
                      "Atualizar",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white
                      ),
                    ),

                  ],
                ),

                onPressed: _RecuperarPreco,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
