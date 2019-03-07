import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

///一个支持手势划动和自动播放的图像展示控件。

final List<String> imgList = [
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542970460173&di=1d5492ff6475d204c968f3e18fe7e044&imgtype=0&src=http%3A%2F%2Fuploads.xuexila.com%2Fallimg%2F1803%2F53-1P315150439.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542970460167&di=f759e5ae1b289453bd3be040e842bfd6&imgtype=0&src=http%3A%2F%2Ftp.yiaedu.com%2Fshowimg.php%3Furl%3Dhttp%3A%2F%2Fuploads.xuexila.com%2Fallimg%2F1703%2F966-1F330145119-50.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542970460167&di=7fb445fafe00daa5b2618f0878f35b72&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F43a7d933c895d14356f837f779f082025baf075c.jpg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542970460164&di=2f9dd6254696f6a3565519bc215e2b7d&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181119%2F60ea67f6715447c08d183d25cfc5403d.jpeg',
  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542970460163&di=1b4659fc365ee6a1c224958e7879acfd&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F96dda144ad3459823295344606f431adcaef84c3.jpg',
   'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542970487800&di=5d0aaf07f62606f06c7769c9ecb18963&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F2f738bd4b31c870183ff60322d7f9e2f0608ff9d.jpg',
];

final Widget placeholder = new Container(color: Colors.grey);

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i  ++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselDemo extends StatelessWidget {
  CarouselSlider instance;

  nextSlider() {
    instance.nextPage(duration: new Duration(milliseconds: 300), curve: Curves.linear);
  }

  prevSlider() {
    instance.previousPage(duration: new Duration(milliseconds: 800), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    instance = new CarouselSlider(
      items: imgList.map((url) {
        return new Container(
            margin: new EdgeInsets.all(5.0),
            child: new ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                child: new Image.network(url,
                  fit: BoxFit.cover,
                  width: 1000.0,
                )
            )
        );
      }).toList(),
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
    );
    // print(instance.nextPage());
    return new MaterialApp(
        title: 'demo',
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Carousel slider demo')),
            body: new ListView(
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 15.0),
                    child: instance
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new RaisedButton(
                          onPressed: nextSlider,
                          child: new Text('next slider')
                      ),
                    ),
                    new Expanded(
                        child: new RaisedButton(
                            onPressed: prevSlider,
                            child: new Text(' prev slider')
                        )
                    )
                  ],
                ),
                new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 15.0),
                    child: new CarouselSlider(
                      items: map<Widget>(imgList, (index, i) {
                        return new Container(
                            margin: new EdgeInsets.all(5.0),
                            child: new ClipRRect(
                                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                                child: new Stack(
                                  children: <Widget>[
                                    new Image.network(i,
                                      fit: BoxFit.cover,
                                      width: 1000.0,
                                    ),
                                    new Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: new Container(
                                            decoration: new BoxDecoration(
                                                gradient: new LinearGradient(
                                                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                )
                                            ),
                                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                            child: new Text('No. $index image',
                                              style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                        )
                                    ),
                                  ],
                                )
                            )
                        );
                      }).toList(),
                      autoPlay: false,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                    )
                ),
              ],
            )
        )
    );
  }
}