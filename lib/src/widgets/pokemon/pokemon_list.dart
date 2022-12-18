import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Pokemon {
  final String name;
  final String url;
  final int id;
  const Pokemon({
    required this.name,
    required this.url,
    required this.id,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json, id) {
    return Pokemon(
      name: json['userId'],
      url: json['url'],
      id: id,
    );
  }
}

Future<List<Pokemon>> fetchPokeList() async {
  // final thumbnailUrl =
  //     "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/134.png";
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));
  List<dynamic> results = [];
  if (response.statusCode == 200) {
    results = json.decode(response.body)['results'];
    List<Pokemon> pokeList = [];
    for (int index = 1; index < results.length; index++) {
      pokeList.add(
        Pokemon(
            name: results[index]['name'],
            url: results[index]['url'],
            id: index),
      );
    }
    return pokeList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemon>> pokemonList;

  @override
  void initState() {
    super.initState();
    pokemonList = fetchPokeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: pokemonList,
          builder: (context, snapshot) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return Expanded(
                  child: Column(
                    children: [
                      Text('Id ${snapshot.data![index].name}'),
                      Text('Url ${snapshot.data![index].url}'),
                      Text('Name ${snapshot.data![index].name}'),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
