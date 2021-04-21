import 'package:flutter/material.dart';
import 'package:flutter_app/login/login_page.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('登入'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.login_outlined,
            color: Colors.blueGrey,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => LoginPage())); // do something
          },
        )
      ],
    ));

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
