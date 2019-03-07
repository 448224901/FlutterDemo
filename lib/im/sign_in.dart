import 'package:flutter/material.dart';
import 'package:flutter_app/im/prompt_page.dart';
import 'package:flutter_app/im/showawait.dart';

class SingIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SingInState();
  }
}

class SingInState extends State<SingIn> {
  final TextEditingController _usernameContorller = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _correctUsername = '';
  String _correPassword = '';
  PromptPage promptPage = new PromptPage();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('images/timg.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/ic_nav_discover_normal.png',
                  width: MediaQuery.of(context).size.width *
                      0.4, //设置image控件的宽度为当前屏幕宽度的40%
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.96,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _usernameContorller,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        errorText:
                            ('' == _correctUsername) ? null : _correctUsername,
                        icon: Icon(Icons.account_circle),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          if (value.isEmpty) {
                            _correctUsername = '用户名不能为空';
                          } else if (value.trim().length < 3) {
                            _correctUsername = '用户名长度不够';
                          } else {
                            _correctUsername = "";
                          }
                        });
                      },
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'password',
                        errorText:
                            (_correPassword == '') ? null : _correPassword,
                        icon: Icon(Icons.lock_outline),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          if (value.isEmpty) {
                            _correPassword = '密码不能为空';
                          } else if (value.trim().length < 6) {
                            _correPassword = '密码长度不够';
                          } else {
                            _correPassword = "";
                          }
                        });
                      },
                    ),
                    FlatButton(
                        onPressed: () {
                          _handleSubmitted();
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                          ),
                          child: Center(
                            child: Text(
                              'Sing In',
                              style: TextStyle(
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future _handleSubmitted() async {
    if (_usernameContorller.text == '' || _passwordController.text == '') {
      await promptPage.showMessage(context, "用户名和密码不能为空");
      return;
    } else if (_correctUsername.isNotEmpty || _correPassword.isNotEmpty) {
      await promptPage.showMessage(context, '用户名或者密码格式错误');
      return;
    }
//    Navigator.push(
//  context, MaterialPageRoute(builder: (context) => ShowAwait()));
    showDialog(
      context: context,
      barrierDismissible: false,
      child: ShowAwait(),
    );
  }
}
