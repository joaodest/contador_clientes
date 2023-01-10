import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  bool get isEmpty => count == 0;

  bool get isFull => count == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://img.wallpapic-br.com/i0376-823-47/medium/interior-da-cozinha-restaurante-garrafa-imagem-de-fundo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? "Lotado!" : "Controle de clientes",
              style: TextStyle(fontSize: 30,
                  color: isFull ? Colors.red : Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 70,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (count != 0) {
                        count--;
                        print(count);
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.1) : Colors.white,
                    fixedSize: const Size(75, 75),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child:
                  const Text("Saiu", style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  width: 13,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (isFull) {

                      }
                      else {
                        count++;
                        print(count);
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.white.withOpacity(0.1) : Colors.white,
                    fixedSize: const Size(75, 75),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Entrou",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
