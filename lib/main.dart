import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Rinjani Mountain",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Lombok, Indonesia",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          )),
          FavoriteWidget(),
        ],
      ),
    );

    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          "The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok"
          "A climb to the top is one of the most exhilarating experiences you can have in Indonesia. At 3,726 meters tall,"
          "Gunung Rinjani is the second highest mountain in Indonesia. The climb to the "
          "top may not be easy but it’s worth it, and is widely regarded as one of the best views in the country.",
          softWrap: true,
        ));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo"),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/rinjani.jpg',
              width: 400,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            CallWidget(),
            textSection
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text("$_favoriteCount"),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _isCLick = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //padding: const EdgeInsets.only(bottom: 2),
                child: IconButton(
                  icon: Icon(Icons.call),
                  color: Colors.blueAccent,
                  onPressed: _toggle,
                ),
              ),
              Text(
                "Call",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.near_me),
                  color: Colors.blueAccent,
                  onPressed: _toggle,
                ),
              ),
              Text(
                "Route",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //padding: const EdgeInsets.only(bottom: 2),
                child: IconButton(
                  icon: Icon(Icons.share),
                  color: Colors.blueAccent,
                  onPressed: _toggle,
                ),
              ),
              Text(
                "Share",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      if (_isCLick) {
        _isCLick = false;
      }
    });
  }
}
