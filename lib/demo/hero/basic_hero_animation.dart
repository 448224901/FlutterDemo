import 'package:flutter/material.dart';
import 'package:flutter_app/demo/hero/hero_animation.dart';

class BasicHeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            HomeBody(),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HeroAnimation()));
              },
              color: Colors.red,
              child: Text('共享元素案例'),
            ),
          ],
        )
      ),
    );
  }
}

class HomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new Scaffold(
                appBar: new AppBar(
                  title: const Text('Flippers Page'),
                ),
                body: new Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  // Use background color to emphasize that it's a new route.
                  color: Colors.lightBlueAccent,
                  child: new Hero(
                    tag: 'flippers',
                    child: new SizedBox(
                      width: 100.0,
                      child: new Image.asset(
                        'images/timg.jpg',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      // Main route
      child: new Hero(
        tag: 'flippers',
        child: new Image.asset(
          'images/timg.jpg',
        ),
      ),
    );
  }
}