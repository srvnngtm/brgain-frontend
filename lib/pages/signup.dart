import 'dart:convert';

import 'package:brgain/services/http_requests.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("New user"),
        titleSpacing: 2.0,
        centerTitle: true,
      ),
      // backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: const Text(
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    // color: Colors.grey[500],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: const Text(
                  "create an account, its free!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    // color: Colors.grey[500],
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
                  validator: (val) => !isEmail(val!) ? "Invalid Email" : null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child:  TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child:  TextFormField(
                  scrollPadding: EdgeInsets.only(bottom:40),
                  validator: (val) => val != passwordController.text? "Passwords dont match" : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm password',
                  ),
                ),
              ),

              SizedBox(height: 20),

              const SizedBox( height: 25, ),
              Container(
                width: 200,
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: ElevatedButton(
                  onPressed: onPressedSignup,
                  child: const Text('Sign Up'),
                ),
              ),
              Container(
                // width: 200,
                child: TextButton(
                  child: const Text(
                    "Already have an account? Login Instead",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: ()=>{
                    Navigator.pop(context)
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ))

            ]),
      ),
    );  }


void onPressedSignup() async {

    String email = emailController.text;
    if(nameController.text.isEmpty){
      return showSnackBar(context, "Name cannot be empty");
    }

  try{
    Map userData  = await HttpRequests.registerUser(emailController.text,
        passwordController.text,
        nameController.text);
    if(userData['success'].toString() == "false"){
      showSnackBar(context, userData['errorMessage']);
    }else{

      Navigator.pushReplacementNamed(context, "/home", arguments: {
        'user' : userData['data']
      });

    }
  }catch(e){
    showSnackBar(context, "unable to register");
  }

}



}

void showSnackBar(BuildContext context, String text)
{
  final snackBar = SnackBar(
    content: Text(text),
    duration: Duration(seconds: 1),//default is 4s
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20),
  );
  // Find the Scaffold in the widget tree and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
