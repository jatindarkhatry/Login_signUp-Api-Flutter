// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_signUp_api/login.dart';
//import 'package:http/http.dart' as http;


class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  TextEditingController EmailController= TextEditingController();
  TextEditingController PasswordController= TextEditingController();

  void login(String email , password) async {
    try{
      Response response= await post(
          Uri.parse("https://reqres.in/api/register"),
          body: {
            'email' : email,
            'password' : password,
          }
      );
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data);
        print("Account Created successfully");
      }else{
        print("Failed");
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('SignUp Api'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    hintText: "Email"
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: PasswordController,
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                ),
                SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                login(EmailController.text.toString(), PasswordController.text.toString());
              },
              child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color:  Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                    ),
                  ),
            ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account"),
                     InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApi()));
                         },
                         child: Text(" Login",style: TextStyle(color: Colors.red),)),


                      ],
                )
              ],
            ),
          ),
        ));
  }
}
