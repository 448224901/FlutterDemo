import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stack绝对布局'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: const Alignment(0.6, 0.6),
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/timg.jpg'),
                radius: 100.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Text(
                  'Mia B',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          IndexStackWidget(),
        ],
      )
    );
  }
}

class IndexStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: IndexedStack(
        index: 1,
        alignment: const Alignment(0.6, 0.6),
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/pic.jpg'),
            radius: 100.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Mia B',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
