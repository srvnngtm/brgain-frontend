import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      //   titleSpacing: 2.0,
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          const Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(40),
            child: Text(
              "Strings",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    showCursor: true,
                    // maxLines: 1,
                    maxLength: 20,
                  ),
                ),
              )
            ],
          )
          // Row(children: const [
          //   Text("email"),
          //   TextField(
          //     textAlign: TextAlign.center,
          //     showCursor: false,
          //     maxLength: 20,
          //     maxLines: 1,
          //   ),
          // ])
        ]),
      ),
    );
  }
}
