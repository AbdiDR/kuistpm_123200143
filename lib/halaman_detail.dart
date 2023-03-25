import 'package:flutter/material.dart';
import 'package:kuistpm_123200143/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final PokemonData pokemon; // class var
  const HalamanDetail({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    bool check = false;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Detail Pokemon"),
              backgroundColor: Colors.red,
              actions: <Widget>[
                IconButton(
                    icon: new Icon(
                      Icons.favorite,
                      color: widget.pokemon.isFavorite? Colors.white:Colors.black,
                    ),
                    onPressed: ()
                    {
                      setState(() {
                        check = true;
                      });
                    }
                ),
              ],
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Image(
                        height : 250,
                        width: 250,
                        image: NetworkImage(widget.pokemon.image),
                      ),
                      const SizedBox(height:20.0),
                      Column(
                        children: [
                          Text(widget.pokemon.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(height: 15,),
                          Text("Type",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 5,),
                          Text(widget.pokemon.type.toString(),
                              style: const TextStyle( fontSize: 14)),
                          SizedBox(height: 15,),
                          Text("Weakness",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 5,),
                          Text(widget.pokemon.weakness.toString(),
                              style: const TextStyle( fontSize: 14)),
                          SizedBox(height: 15,),
                          Text("Previous Evolution",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 5,),
                          Text(widget.pokemon.prevEvolution.toString(),
                              style: const TextStyle( fontSize: 14)),
                          SizedBox(height: 15,),
                          Text("Type",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 5,),
                          Text(widget.pokemon.nextEvolution.toString(),
                              style: const TextStyle( fontSize: 14)),
                          SizedBox(height: 15,),
                          ElevatedButton.icon(
                            onPressed: () {
                              _launchUrl(widget.pokemon.wikiUrl);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              primary: Colors.red,
                            ),
                            icon: Icon(Icons.search),  //icon data for elevated button
                            label: Text("Cari"), //label text
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            )
        ));
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
