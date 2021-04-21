
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/Api/Api.dart';
import 'package:flutter_app/Model/Account.dart';
import 'package:flutter_app/home/Home.dart';
import 'package:flutter_app/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var accountController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登入'),
      ),

      body:SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Center(
              child: Image.asset('assets/images/unnamed.jpeg'),
    ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15),
            child:TextField(
              controller: accountController,
                decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  hintText: 'Enter your username',
               ),
              ),
            ),
            Padding(
                padding:EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                child:TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:  'Enter your password'
                  ),
              ),
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:ElevatedButton(
                  child:Text('登入',style: TextStyle(fontSize: 20),),
                  onPressed: (){
                    Api.queryAccount(accountController.text,passwordController.text).then((value) {
                      var data = Account.fromJson(value);

                    // if( data.rs== 0)
                    //   {
                    //       showDialog(
                    //           context: context,
                    //           builder: (context)){
                    //         Future.delayed(Duration(seconds: 1),(){
                    //           Navigator.pop(context);
                    //         });
                    //         return AlertDialog(
                    //
                    //         )
                    //       }
                    //   }
                  });

                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
