import 'package:flutter/material.dart';
import 'package:flutter_app/flutterstudy/widget/demo_lifecycle/lifecycle_page.dart';
import 'package:flutter_app/flutterstudy/widget/home_page.dart';
import 'package:flutter_app/router/navigatordemo.dart';
import 'package:flutter_app/router/router1.dart';
import 'package:flutter_localizations/flutter_localizations.dart';//国际化

class MyStudyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      localizationsDelegates: [//国际化
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [//国际化
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
      home: HomePage(),
      routes: <String ,WidgetBuilder>{
        '/flutterstudy/LifecyclePage': (BuildContext context) => new LifecyclePage(),
      },
    );
  }
}