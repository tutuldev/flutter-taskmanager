import 'package:flutter/material.dart';
import 'package:taskmannager/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmannager/screen/onboarding/loginScreen.dart';
import 'package:taskmannager/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmannager/screen/onboarding/registrationScreen.dart';
import 'package:taskmannager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmannager/screen/onboarding/splashScreen.dart';
import 'package:taskmannager/screen/task/newTaskListScreen.dart';
import 'package:taskmannager/utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');
  if(token==null){
    runApp( MyApp("/login"));
  }else{

    runApp( MyApp("/newTaskList"));
  }

}

class MyApp extends StatelessWidget {
  final String FirstRoute;
   MyApp(this.FirstRoute);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Mannger",
      // initialRoute: '/',
      initialRoute: FirstRoute,
      // initialRoute: '/registration',
      // initialRoute: '/emailVerification',
      // initialRoute: '/setPassword',
      // initialRoute: '/pinVerification',
      routes: {
        '/':(context)=> splashScreen(),
        '/login':(context)=>loginScreen(),
        '/registration':(context)=>registrationsScreen(),
        '/emailVerification':(context)=>emailVerificationScreen(),
        '/pinVerification':(context)=>pinVerificationScreen(),
        '/setPassword':(context)=>setPasswordScreen(),
        '/newTaskList':(context)=>newTaskListScreen()
      },
    );
  }
}
