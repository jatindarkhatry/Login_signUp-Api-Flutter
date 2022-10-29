import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class LoginApi extends StatefulWidget {
  const LoginApi({Key? key}) : super(key: key);

  @override
  State<LoginApi> createState() => _LoginApiState();
}

class _LoginApiState extends State<LoginApi> {

  TextEditingController EmailController= TextEditingController();
  TextEditingController PasswordController= TextEditingController();

  void login(String email , password) async {
    try{
      Response response= await post(
          Uri.parse("https://reqres.in/api/login"),
          body: {
            'email' : email,
            'password' : password,
          }
      );
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data);
        print("Login successfully");
      }else{
        print("Incorrect Email or Password");
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login Api'),
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
                      child: Text("Login",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Dont have an account"),
                    Text(" Sign Up",style: TextStyle(color: Colors.red),),

                  ],
                )
              ],
            ),
          ),
        ));
  }
}
