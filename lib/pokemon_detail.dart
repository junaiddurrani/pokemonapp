import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon_model.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetail(this.pokemon);
  @override
  _PokemonDetailState createState() => _PokemonDetailState(this.pokemon);
}

class _PokemonDetailState extends State<PokemonDetail> {
  Pokemon pokemon;
  _PokemonDetailState(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                child: Hero(
                  tag: pokemon.img,
                  child: Image(
                    filterQuality: FilterQuality.high,
                    image: NetworkImage(pokemon.img),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.brown[400],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(pokemon.name,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Height: " + pokemon.height,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0)),
                        Text("Weight: " + pokemon.weight,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text("Weakness",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses.map((t) => Expanded(
                        child: FilterChip(
                        backgroundColor: Colors.white70,
                        label: Text(t, style: TextStyle(color: Colors.brown)),
                        onSelected: (b){},
                      )
                      )).toList(),
                    ),
                    SizedBox(height: 20.0),
                    Text("Next Evolution",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution == null ? [] : pokemon.nextEvolution.map((n) => Expanded(
                        child: FilterChip(
                        backgroundColor: Colors.white70,
                        label: Text(n.name, style: TextStyle(color: Colors.brown)),
                        onSelected: (b){},
                      ),
                      )).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
