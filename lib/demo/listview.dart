import 'package:flutter/material.dart';

// 创建类，成就目标
class Target {
  // 常量，构建函数
  const Target(
      {
      // 自变量，目标名称
      this.name,
      // 自变量，目标奖励
      this.reward});

  // 最终值，成就目标名称
  final String name;

  // 最终值，成就目标奖励
  final String reward;
}

class AchievementView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AchievementViewList(targets: _kTargets);
  }
}

final List<Target> _kTargets = <Target>[
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
  new Target(name: '生存100天', reward: "金钱￥2500\t最高能量+20"),
  new Target(name: '大学毕业', reward: "获得毕业学位\t金钱￥5000\t最高情绪+30"),
  new Target(name: '获得￥5000', reward: "获得信用卡"),
  new Target(name: '购买廉价的公寓', reward: "最高能量+60\t最高饥饿度+30"),
  new Target(name: '购买普通的公寓', reward: "最高能量+80\t最高饥饿度+50"),
];

//// 创建类，成就视图列表项目，继承StatefulWidget（有状态的控件）
class AchievementViewList extends StatefulWidget {
  // 构造函数
  AchievementViewList({
    // 自变量，目标列表
    this.targets,
    // 控件和元素的标识符
    Key key,
  }) : // 调用父类
        super(
            // 使用父类的控件和元素标识符
            key: key);

  // 最终值，目标列表
  final List<Target> targets;

  /*
   * 覆盖具有相同名称的超类成员
   * 在树中的给定位置为此控件创建可变状态
   *  子类应重写此方法以返回其关联的State子类新创建的实例
   */
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AchievementViewState();
  }
}

/*
 * 关联State子类的实例
 *  继承State：StatefulWidget（有状态的控件）逻辑和内部状态
 */
class _AchievementViewState extends State<AchievementViewList> {
// 类成员，存储成就集合
  Set<Target> _achievements = new Set<Target>();

  /*
   * 类函数，成就改变
   *  target：传递目标
   *  nowTarget：是否新目标
   */
  void _achievementsChanged(Target target, bool nowTarget) {
    // 通知框架此对象的内部状态已更改
    setState(() {
      /*
       * 如果是新目标
       *  存储成就集合，增加目标
       *  否则，移除目标
       */
      if (nowTarget) {
        _achievements.add(target);
      } else {
        _achievements.add(target);
      }
    });
  }

// 覆盖此函数以构建依赖于动画的当前状态的控件
  @override
  Widget build(BuildContext context) {
    // 返回值，创建包含列表项的可滚动列表
    return ListView(
      /*
       * 要在此列表中显示的控件
       *  迭代当前配置的目标列表中的目标
       *  为每一个调用函数创建成就目标类
       */
        children: widget.targets.map(
                (Target target) {
              // 返回值，创建成就目标类
              return new AchievementViewItem(
                // 传递目标：本轮迭代中的目标
                target: target,
                // 是否新目标：如果目标在成就集合中，则返回true
                nowTarget: _achievements.contains(target),
                // 对目标的改变：类函数，成就改变
                onTargetChanged: _achievementsChanged,
              );
            }
        ).toList()
    );
  }
}

// 定义数据类型，目标改变回调
typedef void TargetChangedCallback(
    // 类型参数，目标
    Target target,
    // 类型参数，是否新目标
    bool nowTarget
    );


// 创建类，成就视图列表项目，继承StatelessWidget（无状态的控件）
class AchievementViewItem extends StatelessWidget {
  // 构造函数
  AchievementViewItem(
      { // 目标参数，传递目标
      Target target,
      // 自变量，是否新目标
      this.nowTarget,
      // 自变量，对目标的改变
      this.onTargetChanged})
      :
        // 接收传递的目标
        target = target,
        super(
            /*
       * 控件和元素的标识符：
       *  将其对象的标识用作其值
       *  用于将控件的标识绑定到用于生成该控件的对象的标识
       */
            key: new ObjectKey(target));

// 类成员，存储目标
  final Target target;

  // 类成员，存储是否新目标
  final bool nowTarget;

  // 类成员，对目标的改变
  final TargetChangedCallback onTargetChanged;

  // 类函数，获得颜色
  Color _getColor(BuildContext context) {
    /*
     *  是否新目标
     *    是：返回灰色
     *    否：返回主题的背景色
     */
    return nowTarget ? Colors.black54 : Theme.of(context).primaryColor;
  }

  // 类函数，获得文本样式
  TextStyle _getNameTextStyle(BuildContext context) {
    // 如果不是新目标，返回文本样式控件
    if (!nowTarget)
      return TextStyle(
        // 绘制文本的大小：16.0
        fontSize: 16.0,
        // 绘制文本时使用的颜色：黑色
        color: Colors.black,
        // 绘制文本时加粗字体
        fontWeight: FontWeight.bold,
      );
    // 返回文本样式控件
    return TextStyle(
      fontSize: 16.0,
      // 绘制文本时使用的颜色：灰色
      color: Colors.black54,
      // 绘制文本时加粗字体
      fontWeight: FontWeight.bold,
      // 在文本附近绘制的装饰：文本中绘制一条横线
      decoration: TextDecoration.lineThrough,
    );
  }

  // 类函数，获得文本样式
  TextStyle _getRewardTextStyle(BuildContext context) {
    // 如果不是新目标，返回文本样式控件
    if (!nowTarget)
      return new TextStyle(
        // 绘制文本的大小：13.0
        fontSize: 13.0,
        // 绘制文本时使用的颜色：黑色
        color: Colors.black,
      );
    // 返回文本样式控件
    return new TextStyle(
      // 绘制文本的大小：13.0
      fontSize: 13.0,
      // 绘制文本时使用的颜色：灰色
      color: Colors.black54,
      // 在文本附近绘制的装饰：文本中绘制一条横线
      decoration: TextDecoration.lineThrough,
    );
  }

// 覆盖此函数以构建控件
  @override
  Widget build(BuildContext context) {
    // 返回值：创建列表项，通常包含图标和一些文本
    return ListTile(
      // 当用户点击此列表项时调用
      onTap: () {
        //调用对目标的改变函数
        onTargetChanged(target, !nowTarget);
      },
      // 要在标题之前显示的控件：创建圆形头像控件
      leading: CircleAvatar(
        // 填充圆形的颜色：获得颜色函数
        backgroundColor: _getColor(context),
        child: Text('囧'),
      ),
      // 列表项目的主要内容：创建堆栈布局控件
      title: new Stack(
        /*
         * 列表项目的主要内容：
         *  定位位置
         *    左边与顶部
         *  文本控件
         *    文本内容
         *    获得文本样式函数
         */
        children: <Widget>[
          Positioned(
              left: 0.0,
              top: 0.0,
              child: new Text(
                target.name,
                style: _getNameTextStyle(context),
              )),
          Positioned(
              left: 0.0,
              top: 20.0,
              child: Text(
                '奖励' + '\n' + target.reward,
                style: _getRewardTextStyle(context),
              )),
        ],
      ),
    );
  }
}


main(){
  runApp(MaterialApp(
    title: 'list',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('list'),
      ),
      body: Center(
        child: AchievementView(),
      ),
    ),
  ));
}