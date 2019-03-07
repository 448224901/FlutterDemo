import 'package:flutter/material.dart';
import 'package:flutter_app/demo/animation01.dart';
import 'package:flutter_app/demo/animation02.dart';
import 'package:flutter_app/demo/animationdemo.dart';

main() {
  runApp(MaterialApp(
    title: '有状态的widget',
    home: Counter(),
    debugShowCheckedModeBanner: false,//去除debug标签
    routes: <String, WidgetBuilder>{
      // 这里可以定义静态路由，不能传递参数
//      '/router/second': (_) => new SecondPage(),
      MyApp.routName: (_) => new MyApp(),
      AnimationHome.routName: (_) => AnimationHome(),
      AnimationHome02.routName: (_) => AnimationHome02(),
    },
  ));
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidget"),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            '红色+黑色删除线+25号',
            style: TextStyle(
                color: const Color(0xffff0000),
                decoration: TextDecoration.lineThrough,
                decorationColor: const Color(0xff000000),
                fontSize: 25.0),
          ),
          Text(
            '橙色+下划线+24号',
            style: TextStyle(
                color: const Color(0xffff9900),
                decoration: TextDecoration.underline,
                fontSize: 24.0),
          ),
          Text(
            '虚线上划线+23号+倾斜',
            style: TextStyle(
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 23.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'serif字体+24号',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 26.0,
            ),
          ),
          Text(
            'monospace字体+24号+加粗',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '天蓝色+25号+2行跨度',
            style: TextStyle(
              color: const Color(0xff4a86e8),
              fontSize: 25.0,
              height: 2.0,
            ),
          ),
          Text(
            '24号+2个字母间隔',
            style: TextStyle(
              fontSize: 24.0,
              letterSpacing: 2.0,
            ),
          ),
          CounterDisplay(count: _count),
          ImageDemo(),
          AssetImageDemo(),
          RowDemo(),
          ColumnDemo(),
          StackDemo(),
          AlignDemo(),
          PaddingDemo(),
          SizedBoxDemo(),
          AspectRatioDemo(),
          DecoratedBoxDemo(),
          OpacityDemo(),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyApp.routName);
            },
            child: Text('跳转animationdemo'),
          ),
          Card(
            child: Center(
              child: Text(
                '卡片设计',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
//        int maximumEmergy;
//    int maximumHunger;
//    int maximumMood;
//    int currentEmergy;
//    int currentHunger;
//    int currentMood;
          LinearProgressIndicatorDemo(
              maximumEmergy: 100,
              maximumHunger: 100,
              maximumMood: 100,
              currentEmergy: 10,
              currentHunger: 20,
              currentMood: 30),
          BottomSheetDemo(),
          AxisAlignDemo(),
          ExpandedDemo(),
          AxisSizeDemo(),
          DecorationDemo(),
          RaisedButton(
              child: Text('跳转animation01'),
              onPressed: () {
                Navigator.pushNamed(context, AnimationHome.routName);
              }),
          RaisedButton(
              child: Text('跳转animation02'),
              onPressed: () {
                Navigator.pushNamed(context, AnimationHome02.routName).then((value){
                  print('value:$value');
                });
              }),
          MyAnimation(),
          TextSpanWidget(),
        ],
      ),
      floatingActionButton: CounterIncrementor(onPressed: _increment),
    );
  }
}

/**
 * 文本片段
 */
class TextSpanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
          text: 'Home:'
        ),
        TextSpan(
          text: 'https://flutterchina.club',
          style: TextStyle(
            color: Colors.blue
          ),
          recognizer: null
        )
      ]
    ));
  }
}


class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: '增加',
      child: Icon(Icons.add),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '按钮点击$count次',
        style: TextStyle(fontSize: 25.0, color: Colors.red),
      ),
    );
  }
}

/**
 * 获取网络图片
 */
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.network(
      "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg",
      scale: 1.0,
      height: 150.0,
    );
  }
}

/**
 *本地图片
 **/
class AssetImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(
      'images/timg.jpg',
      height: 150.0,
    );
  }
}

/**
 *水平布局
 **/
class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            print('点击了红色按钮');
          },
          color: const Color(0xffcc0000),
          child: Text('红色按钮'),
        ),
        Expanded(
            flex: 1, //控制灵活子控件,需要使用Expanded控件：
            child: RaisedButton(
              onPressed: null,
              color: const Color(0xfff1c232),
              child: Text('黄色按钮'),
            )),
        RaisedButton(
          onPressed: () {
            print('点击粉色按钮事件');
          },
          color: const Color(0xffea9999),
          child: Text('粉色按钮'),
        ),
      ],
    );
  }
}

/**
 * 垂直布局
 */
class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: new Column(children: <Widget>[
        new RaisedButton(
          onPressed: () {
            print('点击红色按钮事件');
          },
          color: const Color(0xffcc0000),
          child: new Text('红色按钮'),
        ),
        new Expanded(
          flex: 1,
          child: new RaisedButton(
            onPressed: () {
              print('点击黄色按钮事件');
            },
            color: const Color(0xfff1c232),
            child: new Text('黄色按钮'),
          ),
        ),
        new RaisedButton(
          onPressed: () {
            print('点击粉色按钮事件');
          },
          color: const Color(0xffea9999),
          child: new Text('粉色按钮'),
        ),
      ]),
    );
  }
}

/**
 * Stack层叠定位
 * Stack控件的每一个子控件都是定位或不定位，定位的子控件是被Positioned控件包裹的。Stack控件本身包含所有不定位的子控件，其根据alignment定位（默认为左上角）。然后根据定位的子控件的top、right、bottom和left属性将它们放置在Stack控件上。
 */
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      // Aligment 的取值范围为 [-1, 1]，Stack 中心为 (0, 0)，
      // 这里设置为 (-0.5, -0.5) 后，可以让文本对齐到 Container 的 1/4 处
      children: <Widget>[
        Image.network('http://img2.cxtuku.com/00/13/12/s97783873391.jpg'),
        Positioned(
            left: 35.0,
            right: 35.0,
            top: 45.0,
            child: Text(
              'Whatever is worth doing is worth doing well. ๑•ิ.•ั๑',
              style: TextStyle(fontSize: 20.0, fontFamily: 'serif'),
            )),
      ],
    );
  }
}

/**
 * Align对齐控件
 * 能将子控件所指定方式对齐，并根据子控件的大小调整自己的大小。
 */
/*bottomCenter    (0.5, 1.0)    底部中心
bottomLeft    (0.0, 1.0)    左下角
bottomRight    (1.0, 1.0)    右下角
center    (0.5, 0.5)    水平垂直居中
centerLeft    (0.0, 0.5)    左边缘中心
centerRight    (1.0, 0.5)    右边缘中心
topCenter    (0.5, 0.0)    顶部中心
topLeft    (0.0, 0.0)    左上角
topRight    (1.0, 0.0)    右上角*/
class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 600.0,
      child: Stack(
        children: <Widget>[
          new Align(
            alignment: new FractionalOffset(0.0, 0.0),
            child: new Image.network('http://up.qqjia.com/z/25/tu32710_10.jpg'),
          ),
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Image.network('http://up.qqjia.com/z/25/tu32710_11.jpg'),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,//将子行紧密地打包在一起
            children: <Widget>[
              Icon(Icons.star,color: Colors.green[500],),
              Icon(Icons.star,color: Colors.green[500],),
              Icon(Icons.star,color: Colors.green[500],),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}

/**
 * Padding填充控件
 * 能给子控件插入给定的填充。
 */
class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300.0,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Image.network('http://up.qqjia.com/z/25/tu32710_4.jpg'),
      ),
    );
  }
}

/**
 * SizedBox控件能强制子控件具有特定宽度、高度或两者都有
 */
class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 250.0,
      height: 250.0,
      child: Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent[100]),
      ),
    );
  }
}

/**
 * AspectRatio 控件能强制子小部件的宽度和高度具有给定的宽高比，以宽度与高度的比例表示
 */
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 3.0 / 2.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent[100],
          border: Border.all(),
        ),
      ),
    );
  }
}

/**
 * DecoratedBox控件会在子控件绘制之前或之后绘制一个装饰。
 */
class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[const Color(0xffff2cc), const Color(0xffff6eb4)],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 1.0),
      ) //线性梯度，颜色从0到1渐变
          ),
      child: Container(
        height: 250.0,
        width: 250.0,
      ),
    );
  }
}

/**
 * Opacity控件能调整子控件的不透明度，使子控件部分透明，不透明度的量从0.0到1.1之间，0.0表示完全透明，1.1表示完全不透明。
 */
class OpacityDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Opacity(
        opacity: 0.1,
        child: Container(
          width: 250.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: const Color(0xff000000),
          ),
        ),
      ),
    );
  }
}

/**
 *PopupMenuButton控件即弹出菜单控件，点击控件会出现菜单。
 */
class PopupMenuButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

/**
 * LinearProgressIndicator控件是质感设计中的线性进度指示器。
 */
class LinearProgressIndicatorDemo extends StatelessWidget {
  /*
   * 构建函数，传递参数
   *  最大能量值
   *  最大饥饿值
   *  最大情绪值
   *  当前能量值
   *  当前饥饿值
   *  当前情绪值
   */
  LinearProgressIndicatorDemo({
    this.maximumEmergy,
    this.maximumHunger,
    this.maximumMood,
    this.currentEmergy,
    this.currentHunger,
    this.currentMood,
  });

  int maximumEmergy;
  int maximumHunger;
  int maximumMood;
  int currentEmergy;
  int currentHunger;
  int currentMood;

  // 获取进度条描述文本
  Align _getNameText(BuildContext context, String text) {
    return Align(
      alignment: FractionalOffset.topLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 15.0, color: Colors.black, height: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 10.0),
      child: Column(
        // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
        // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
        // free space；类似于 Android 的 wrap_content。
        // 对应的，还有 MainAxisSize.max
        children: <Widget>[
          _getNameText(context, '能量（$currentEmergy/$maximumEmergy）'),
          new LinearProgressIndicator(value: currentEmergy / maximumEmergy),
          _getNameText(context, '饥饿（$currentHunger/$maximumHunger）'),
          new LinearProgressIndicator(value: currentHunger / maximumHunger),
          _getNameText(context, '心情（$currentMood/$maximumMood）'),
          new LinearProgressIndicator(value: currentMood / maximumMood),
        ],
      ),
    );
  }
}

class BottomSheetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () {
          // showModalBottomSheet<T>：显示模态质感设计底部面板
          showBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      '这是模态底部面板，点击任意位置即可关闭',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 24.0),
                    ),
                  ),
                );
              });
        },
        child: Text('显示模态底部面板'),
      ),
    );
  }
}

/**
 * MainAxisAlignment和CrossAxisAlignment类提供了用于控制对齐的各种常量。
 */
class AxisAlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // 沿水平方向平均放置
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset('images/ic_nav_discover_actived.png'),
        Image.asset('images/ic_nav_discover_actived.png'),
        Image.asset('images/ic_nav_discover_actived.png'),
      ],
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Image.asset('images/cover_img.jpg')),
              Expanded(flex: 2, child: Image.asset('images/cover_img.jpg')),
              Expanded(child: Image.asset('images/cover_img.jpg')),
            ],
          ),
        ));
  }
}

/**
 * MainAxisSize.min将子控件紧密包装在一起
 */
class AxisSizeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Icon(Icons.star, color: Colors.green[500]),
          new Icon(Icons.star, color: Colors.green[500]),
          new Icon(Icons.star, color: Colors.green[500]),
          new Icon(Icons.star, color: Colors.black),
          new Icon(Icons.star, color: Colors.black),
        ],
      ),
    );
  }
}

class DecorationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.red),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0))),
                margin: const EdgeInsets.all(4.0),
                child: Image.network(
                    'http://img2.a0bi.com/upload/ttq/20140712/1405166051589_middle.jpg'),
              )),
              new Expanded(
                  child: new Container(
                decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0))),
                margin: const EdgeInsets.all(4.0),
                child: new Image.network(
                    'http://img3.a0bi.com/upload/ttq/20140712/1405166061660_middle.jpg'),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0))),
                margin: const EdgeInsets.all(4.0),
                child: new Image.network(
                    'http://img2.a0bi.com/upload/ttq/20140712/1405166072230_middle.jpg'),
              )),
              new Expanded(
                  child: new Container(
                decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0))),
                margin: const EdgeInsets.all(4.0),
                child: new Image.network(
                    'http://img3.a0bi.com/upload/ttq/20140712/1405166057580_middle.jpg'),
              )),
            ],
          )
        ],
      ),
    );
  }
}

class GridViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewDemo();
  }
}

/**
 * GridView提供了两个预制列表，或者您可以构建自己的自定义网格。当GridView检测到其内容太长，无法适应渲染框时，它会自动滚动。
 */
class _GridViewDemo extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildGrid(),
    );
  }

  Widget buildGrid() {
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      children: _buildGridTileList(20),
    );
  }

  List<Container> _buildGridTileList(int count) {
    return List.generate(
        count,
        (int index) => Container(
              child: Image.network(
                  'http://img2.a0bi.com/upload/ttq/20140712/1405166072230_middle.jpg'),
            ));
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with TickerProviderStateMixin {
  AnimationController controller; //动画控制器
  CurvedAnimation curved; //曲线动画，动画插值，
  bool forward = true;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    curved = CurvedAnimation(
        parent: controller, curve: Curves.bounceOut); //模仿小球自由落体运动轨迹
//    controller.forward();//放在这里开启动画 ，打开页面就播放动画
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //        child: new FadeTransition(//透明度动画
//          opacity: curved,//将动画传入不同的动画widget
//          child: new FlutterLogo(//创建一个小部件，用于绘制Flutter徽标
//            size: 200.0,
//          ),
//        )
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: curved,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
          RaisedButton(onPressed: (){
              if(forward){
                controller.forward();//向前播放动画
              }else{
                controller.reverse();//向后播放动画
              }
              forward = !forward;
          },
          child: Text('开始动画'),),
        ],
      )
    );
  }
}
