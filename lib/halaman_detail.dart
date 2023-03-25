import 'package:flutter/material.dart';
import 'package:kuistpm_123200143/pokemon_data.dart';

class HalamanDetail extends StatefulWidget {
  final PokemonData pokemon; // class var
  const HalamanDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Detail Pokemon"),
              backgroundColor: Colors.red,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        widget.pokemon.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Type                 : ' + widget.pokemon.type[0]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Weakness                : ' + widget.pokemon.weakness[0]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Previous Evolution                : ' + widget.pokemon.prevEvolution[0]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Next Evolution       : ' + widget.pokemon.nextEvolution[0]),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            )
        ));
  }
}
