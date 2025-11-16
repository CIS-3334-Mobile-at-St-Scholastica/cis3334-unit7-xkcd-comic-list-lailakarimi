import 'package:flutter/material.dart';
import 'comic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XKCD Comics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'XKCD Comic List'),
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
  List<Comic> xkcdComics = [];

  _MyHomePageState() {
    xkcdComics.add(Comic(844, "https://imgs.xkcd.com/comics/good_code.png", "Good Code"));
    xkcdComics.add(Comic(1513, "https://imgs.xkcd.com/comics/code_quality.png", "Code Quality"));
    xkcdComics.add(Comic(163, "https://imgs.xkcd.com/comics/donald_knuth.png", "Donald Knuth"));
    xkcdComics.add(Comic(2228, "https://imgs.xkcd.com/comics/machine_learning_captcha.png", "Machine Learning Captcha"));
    xkcdComics.add(Comic(1667, "https://imgs.xkcd.com/comics/algorithms.png", "Algorithms"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // Replace placeholder text with ListView.builder
      body: ListView.builder(
        itemCount: xkcdComics.length,
        itemBuilder: (context, index) {
          final comic = xkcdComics[index];

          return ListTile(
            leading: Image.network(
              comic.img,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
            title: Text(comic.title),
            subtitle: Text("Comic #${comic.num}"),
          );
        },
      ),
    );
  }
}
