import 'package:flutter/material.dart';
import 'package:kuistpm_123200143/pokemon_data.dart';
import 'package:kuistpm_123200143/halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Pokedex"),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              final PokemonData list = listPokemon[index];
              return Card(
                child: Column(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=> HalamanDetail(pokemon:list)
                              ));
                        },
                        child: Column(
                          children: [
                            Image(
                              height : 250,
                              width: 250,
                              image: NetworkImage(list.image),
                            ),
                            const SizedBox(height:100.0),
                            Column(
                              children: [
                                Text(list.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              ],
                            )
                          ],
                        )
                    ),
                  ],
                ),
              );
            },
            itemCount: listPokemon.length,
          ),
        ));
  }
}