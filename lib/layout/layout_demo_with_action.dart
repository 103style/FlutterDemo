import 'package:flutter/material.dart';

// Flex 框( Row 和 Column )
//当一个 flex 框嵌套在另外一个 flex 框或者嵌套在可滚动区域内时，不能使用 Expanded

void main() {
  var title = 'Layout demo with action';

  runApp(MaterialApp(
    title: title,
    home: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  Widget titleSection = Container(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        Favorite(),
      ],
    ),
  );

  static Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  static Color buttonColor = Colors.blue;

  Widget tabButton = Container(
    margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(buttonColor, Icons.call, 'CALL'),
        _buildButtonColumn(buttonColor, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(buttonColor, Icons.share, 'SHARE'),
      ],
    ),
  );

  Widget textSection = Container(
    padding: const EdgeInsets.all(16),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          'res/images/layout_example_img.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection,
        tabButton,
        textSection,
      ],
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoriteState();
  }
}

class FavoriteState extends State<Favorite> {
  bool _isFavorite = true;

  int _favoriteCount = 41;

  void favoriteTapped() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount--;
      } else {
        _favoriteCount++;
      }
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: favoriteTapped,
      child: Row(
        children: <Widget>[
          Icon(
            _isFavorite ? Icons.star : Icons.star_border,
            color: Colors.red[500],
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: Text('$_favoriteCount'),
          ),
        ],
      ),
    );
  }
}
