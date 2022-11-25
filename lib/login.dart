import 'package:flutter/material.dart';
import 'services/http_requests.dart';
import 'services/helper_functions.dart';
import 'package:validators/validators.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:
            Column(
                children: [
          Container(
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                // color: Colors.grey[500],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  // color: Colors.grey[500],
                  decoration:  const BoxDecoration(
                      // color: Colors.grey[500],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child:  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction ,
                      validator: (val) => !isEmail(val!) ? "Invalid Email" : null,
                    controller : emailController,
                    textAlign: TextAlign.center,
                    showCursor: true,
                    decoration: const InputDecoration(
                      hintText: "abc@xyz.com",
                      label: Center(
                        child: Text(
                          "Email id",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ),
                    ),
                    maxLines: 1,
                    maxLength: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  // color: Colors.grey[500],
                  decoration: const BoxDecoration(
                      // color: Colors.grey[500],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: passwordController,
                    showCursor: true,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      label: Center(
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 2),
                        ),
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
              )
            ],
          ),
          const SizedBox( height: 25, ),
          Container(
            width: 200,
            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ElevatedButton(
              onPressed: onPressedLogin,
              child: const Text('Login'),
            ),
          ),
              Container(
                width: 200,
                child: TextButton(
                  child: const Text(
                      "New here? signup instead !",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: ()=>{
                    Navigator.pushNamed(context, "/signup")
                  },
                ),
              )

            ]),
      ),
    );
  }

  void onPressedLogin() async {
    try{
      Map userData  = await HttpRequests.loginUser(emailController.text, passwordController.text);
      if(userData['success'].toString() == "false"){
        showSnackBar(context, userData['errorMessage']);
      }else{
        Navigator.pushReplacementNamed(context, "/home", arguments: {
          'user' : userData['data']
        });
        // print(userData['data']['userName']);
      }
    }catch(e){
      showSnackBar(context, "unable to login");
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

