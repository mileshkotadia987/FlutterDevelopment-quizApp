import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/helper/funtions.dart';
import 'package:quizzler/services/auth.dart';
import 'package:quizzler/views/home_page.dart';
import 'package:quizzler/views/sign_up.dart';
import 'package:quizzler/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  String email,password;
  AuthService authService=AuthService();
  bool isLoading=false;

  signIn()async{
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading=true;
      });
      authService.signInEmailPassword(email, password).then((val){
        if(val != null){
          setState(() {
            isLoading=false;
          });
HelperFuntions.saveUserLoggedInDetails(isLoggedIn: true);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context){
                return Home();
              }));
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: appBar(context),
        brightness: Brightness.light,
      ),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator()),
      )
          : Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Spacer(),
              TextFormField(
                validator: (val){return val.isEmpty ? "Enter email Id" : null;},
                decoration: InputDecoration(
                  hintText: "Email"
                ),
                onChanged: (val){
                  email=val;
                },
              ),
              SizedBox(
                height: 6.0,
              ),
              TextFormField(
                obscureText: true,
                validator: (val){return val.isEmpty ? "Enter password" : null;},
                decoration: InputDecoration(
                    hintText: "Password"
                ),
                onChanged: (val){
                  password=val;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: blueButton(context: context,label: "Sign In")
              ),
              SizedBox(
                height: 18.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?",style: TextStyle(
                    fontSize: 15.0
                  ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context){
                            return SignUp();
                          }));
                    },
                    child: Text("Sign Up",style: TextStyle(
                        fontSize: 15.0,decoration: TextDecoration.underline
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 80.0,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
