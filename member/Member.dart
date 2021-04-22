import 'package:flutter/material.dart';
import 'package:flutter_app/login/loginProvider.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:provider/provider.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginProvider>(context);

    return Scaffold(
        appBar: AppBar(title: Text('會員中心'),
            actions: <Widget>[

          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
                child: Text(
                  (() {
                    if (login.count == 1) {
                      return "登出";
                    }
                    return "登入";
                  }()),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white54, shadowColor: Colors.black87),
                onPressed: () {
                  if (login.count == 1) {
                    login.loginState(false);
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pushNamed(context, "/home");
                          });
                          return AlertDialog(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              content: Container(
                                height: 25,
                                width: 80,
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "登出成功",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    )),
                              ));
                        });
                  } else {
                    Navigator.pushNamed(context, "/loginPage");
                  }
                }),
          )
        ])
        // ],

        );

    //     body:SingleChildScrollView(
    //       child:Column(
    //         children:<Widget>[
    //
    //           Container(
    //             width:MediaQuery.of(context).size.width,
    //             child: Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child:ElevatedButton(
    //                 child:Text('登入',style: TextStyle(fontSize: 20),),
    //                 onPressed: (){
    //
    //                       Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    //                },
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    // );
  }
}
