import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/pokemon_detail.dart';
import 'package:pokemon_app/pokemon_model.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var jsonData;
  PokemonModel pokemonModel;

  getData() async {
    final response = await http.get(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      pokemonModel = PokemonModel.fromJson(jsonData);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white70),
        title: Text("Pokemon App", style: TextStyle(color: Colors.white70)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: pokemonModel == null
          ? Center(
              child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white70),
            ))
          : GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: pokemonModel.pokemon
                  .map((Pokemon pokemon) => Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 0.0,
                          color: Colors.brown[400],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                customBorder: CircleBorder(),
                                splashColor: Colors.brown[300],
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PokemonDetail(pokemon)));
                                },
                                child: Hero(
                                  tag: pokemon.img,
                                  child: Image(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.contain,
                                    image: NetworkImage(pokemon.img),
                                  ),
                                ),
                              ),
                              Text(pokemon.name,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.brown,
        ),
      ),
    );
  }
}
