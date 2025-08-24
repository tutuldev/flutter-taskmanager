import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskmannager/style/style.dart';

class registrationsScreen extends StatefulWidget {
  const registrationsScreen({super.key});

  @override
  State<registrationsScreen> createState() => _registrationsScreenState();
}

class _registrationsScreenState extends State<registrationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Join With Us", style: Head1Text(colorDarkBlue)),
                SizedBox(height: 1),
                Text("Learn with rabbil hasan", style: Head6Text(colorLightGray)),
                SizedBox(height: 20),
                TextFormField(decoration: AppInputDecoration("Email Address"),),
                SizedBox(height: 20),
                TextFormField(decoration: AppInputDecoration("First Name"),),
                SizedBox(height: 20),
                TextFormField(decoration: AppInputDecoration("Last Name"),),
                SizedBox(height: 20),
                TextFormField(decoration: AppInputDecoration("Mobile"),),
                SizedBox(height: 20),
                TextFormField(decoration: AppInputDecoration("Password"),),
                SizedBox (height: 20),
                TextFormField(decoration: AppInputDecoration("Confirm Password"),),
                SizedBox (height: 20),
                Container(child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Registration'),
                  onPressed: (){
                  },
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
