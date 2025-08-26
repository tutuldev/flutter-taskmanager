import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmannager/style/style.dart';

import '../../api/apiClient.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Map<String,String>FormValues={"email":"", "password":""};
  bool Loading=false;


  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value)=>Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['email']!.length==0){
      ErrorToast("Email  Required !");
    }
    else if(FormValues['password']!.length==0){
      ErrorToast("Password Required !");
    }

    else{
      setState(() {Loading=true;});
      bool res= await LoginRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route)=> false);
        // setState(() {Loading=false;}); //for testing


      }
      else{
        setState(() {Loading=false;});
      }


    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
           child: Loading? (Center(child: CircularProgressIndicator())):(SingleChildScrollView(
               padding: EdgeInsets.all(30),
               child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Text("Get Started with", style: Head1Text(colorDarkBlue)),
              SizedBox(height: 1),
              Text("Learn with rabbil hasan", style: Head6Text(colorLightGray)),
              SizedBox(height: 20),

          TextFormField(
            onChanged: (Textvalue){
              InputOnChange("email",Textvalue);
            },
            decoration: AppInputDecoration("Email Address"),
          ),
          SizedBox(height: 20),

          TextFormField(
            onChanged: (Textvalue){
              InputOnChange("password",Textvalue);
            },
            decoration: AppInputDecoration("Password"),
          ),
          SizedBox (height: 20),

          Container(child: ElevatedButton(
            style: AppButtonStyle(),
            child: SuccessButtonChild('Login'),
            onPressed: (){
              FormOnSubmit();
            },
          ),)
        ],
      ),
           )),
          )
        ],
      ),
    );
  }
}
