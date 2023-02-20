import 'dart:convert';
import 'package:api_rest/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final url = Uri.parse("https://my-api-rest.fly.dev/api");
  late Future<List<Producto>> productos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo Api Rest'),
      ),
      body: FutureBuilder<List<Producto>>(
          future: productos,
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(snap.data![i].nombre,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 20, 122),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(snap.data![i].img,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          trailing: Text(
                              snap.data![i].precio.toString() + " pesos",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Divider()
                      ],
                    );
                  });
            }
            if (snap.hasError) {
              return const Center(
                child: Text("Ha habido un problema"),
              );
            }

            return const CircularProgressIndicator();
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    productos = getProductos();
  }

  Future<List<Producto>> getProductos() async {
    final res = await http.get(url); //respuesta en texto
    final lista = List.from(jsonDecode(res.body));

    List<Producto> productos = [];
    lista.forEach((element) {
      final Producto product = Producto.fromJson(element);
      productos.add(product);
    });
    return productos;
  }
}
