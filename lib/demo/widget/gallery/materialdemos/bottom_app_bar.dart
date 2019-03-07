import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatefulWidget {
  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBarWidget> {
  var location = FloatingActionButtonLocation.endDocked;
  var shapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom app bar'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text('fab position'),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                shapIndex = 0;
                this.location = FloatingActionButtonLocation.endDocked;
              });
            },
            child: Text('attached-end'),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                shapIndex = 1;
                this.location = FloatingActionButtonLocation.centerDocked;
              });
            },
            child: Text('attached-center'),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                this.location = FloatingActionButtonLocation.endFloat;
              });
            },
            child: Text('free-end'),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                this.location = FloatingActionButtonLocation.centerFloat;
              });
            },
            child: Text('free-center'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          semanticLabel: 'Action',
        ),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: location,
      bottomNavigationBar: _DemoBottomAppBar(
        color: Colors.white,
        fabLocation: location,
        shape: _selectNotch(shapIndex),
      ),
    );
  }
}

NotchedShape _selectNotch(index) {
  if (index == 0) return null;
  if (index == 1) return const CircularNotchedRectangle();
  return null;
}

class _DiamondNotchedRectangle implements NotchedShape {
  const _DiamondNotchedRectangle();

  @override
  Path getOuterPath(Rect host, Rect guest) {
    if (!host.overlaps(guest)) return Path()..addRect(host);
    assert(guest.width > 0.0);

    final Rect intersection = guest.intersect(host);
    // We are computing a "V" shaped notch, as in this diagram:
    //    -----\****   /-----
    //          \     /
    //           \   /
    //            \ /
    //
    //  "-" marks the top edge of the bottom app bar.
    //  "\" and "/" marks the notch outline
    //
    //  notchToCenter is the horizontal distance between the guest's center and
    //  the host's top edge where the notch starts (marked with "*").
    //  We compute notchToCenter by similar triangles:
    final double notchToCenter =
        intersection.height * (guest.height / 2.0) / (guest.width / 2.0);

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(guest.center.dx - notchToCenter, host.top)
      ..lineTo(guest.left + guest.width / 2.0, guest.bottom)
      ..lineTo(guest.center.dx + notchToCenter, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({this.color, this.fabLocation, this.shape});

  final Color color;
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;

  static final List<FloatingActionButtonLocation> kCenterLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color,
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            child: Text('BottomAppBar'),
          )
        ],
      ),
      shape: shape,
    );
  }
}
