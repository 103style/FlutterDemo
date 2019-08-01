// add  english_words: ^3.1.0  in  pubspec.yaml -> dependencies

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(FirstDemo());

//var title = "Welcome to Flutter";
var title = "Startup Name Generator";

class FirstDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
      home: RandomWords(),
    );
  }
}

var textDirection = TextDirection.ltr;
var textDirectionPressed = TextDirection.ltr;

class RandomWordsState extends State<RandomWords> {
  final _suggestion = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _biggerFontPressed = const TextStyle(
    fontSize: 18.0,
    color: Colors.red,
  );
  final _smallerFont = const TextStyle(fontSize: 14.0);
  final _smallerFontPressed = const TextStyle(
    fontSize: 14.0,
    color: Colors.red,
  );
  final _saveSet = Set<WordPair>();

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saveSet.map(
            (WordPair wordPair) {
              return new ListTile(
                title: new Text(
                  wordPair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textDirection: textDirection,
        ),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestion.length) {
            _suggestion.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestion[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final bool saved = _saveSet.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: saved ? _biggerFontPressed : _biggerFont,
        textDirection: saved ? textDirectionPressed : textDirection,
      ),
      subtitle: Text(
        wordPair.asLowerCase,
        style: saved ? _smallerFontPressed : _smallerFont,
        textDirection: saved ? textDirectionPressed : textDirection,
      ),
      trailing: new Icon(
        saved ? Icons.favorite : Icons.favorite_border,
        color: saved ? Colors.red : null,
        textDirection: saved ? textDirectionPressed : textDirection,
      ),
      onTap: () {
        setState(() {
          if (saved) {
            _saveSet.remove(wordPair);
          } else {
            _saveSet.add(wordPair);
          }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}
