import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:laptop_commerce/Database/Database_Service.dart';

import '../Custom_Widget/Custom_Button.dart';
import '../Model/Laptop.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String password;
  getList() async {
     await DatabaseHelper().getData();
    
  }

 
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (val) {
                  email = val;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (val) {
                  password = val;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  //Login Here..
                  onTap: () {},
                  child: CustomButton(ButtonText: 'Log in')),
            ],
          ),
        ),
      ),
    );
  }
}
