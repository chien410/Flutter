import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Api/Api.dart';
import 'package:flutter_app/Model/Account.dart';
import 'package:flutter_app/home/Home.dart';
import 'package:flutter_app/main.dart';
import 'package:provider/provider.dart';

import 'loginProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Account account;

  var accountController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登入'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset('assets/images/unnamed.jpeg'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: TextField(
                  controller: accountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your username',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    child: Text(
                      '登入',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Api.queryAccount(
                              accountController.text, passwordController.text)
                          .then((value) {
                        var data = Account.fromJson(value);
                        print(value);
                        // rs == 0 代表通過
                        // rs == 4 代表失敗
                        if (data.rs == 0) {
                           Provider.of<LoginProvider>(context,listen: false).loginState(true);
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => MyHomePage()));
                                });
                                return AlertDialog(
                                    backgroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    content: Container(
                                      height: 25,
                                      width: 80,
                                      child: Align(
                                          alignment: Alignment.center,
                                          child:
                                          Text(
                                            "登入成功",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )),
                                    ));
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.pop(context);
                                });
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.announcement_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                      ),
                                      Text(
                                        "It's Wrong!",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
