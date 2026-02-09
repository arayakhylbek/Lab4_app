import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assets & Buttons',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Переменная для переключения между картинками
  bool _showFirstImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Блок с картинкой и текстом сверху
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    _showFirstImage ? 'image1.jpeg' : 'image2.jpeg',
                    /* BoxFit.fill: Растягивает на весь бокс (возможны искажения).
                      BoxFit.contain: Вписывает целиком без искажений.
                      BoxFit.cover: Заполняет весь бокс, обрезая края.
                      BoxFit.fitWidth: Масштабирует по ширине.
                      BoxFit.fitHeight: Масштабирует по высоте.
                      BoxFit.none: Без масштабирования.
                      BoxFit.scaleDown: Уменьшает, если картинка больше бокса.
                    */
                    fit: BoxFit.fill,
                  ),
                ),
                // Затемнение
                Container(
                  color: Colors.black.withOpacity(0.4),
                ),
                // Текст вверху
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Welcome to Flutter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // 1. ElevatedButton: Показать SnackBar
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Show SnackBar")),
                );
              },
              child: const Text("Show SnackBar", style: TextStyle(fontSize: 16)),
            ),
          ),

          const SizedBox(height: 10),

          // 2. TextButton: Переход на второй экран
          SizedBox(
            width: 200,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text("Go to Second Screen", style: TextStyle(fontSize: 16)),
            ),
          ),

          const SizedBox(height: 10),

          // 3. OutlinedButton: Переключить картинку
          SizedBox(
            width: 200,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  _showFirstImage = !_showFirstImage;
                });
              },
              child: const Text("Toggle Image", style: TextStyle(fontSize: 16)),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

// ВТОРОЙ ЭКРАН
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Second Screen")),
      body: const Center(
        child: Text(
          "Second Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}