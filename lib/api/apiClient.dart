import 'dart:convert';
import 'package:http/http.dart' as http;
import '../style/style.dart';
import '../utility/utility.dart';

var BaseURL="https://task.teamrabbil.com/api/v1";
var RequestHeader={"Content-Type": "application/json"};


Future<bool> LoginRequest (FormValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FormValues);

  var response= await http.post(URL,headers: RequestHeader, body: PostBody);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode (response.body);

  if (ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail! try again");
    return false;
  }
}



Future<bool> RegistrationRequest (FormValues) async{

  var URL=Uri.parse("${BaseURL}/registration");
  var PostBody=json.encode(FormValues);

  var response= await http.post(URL,headers: RequestHeader, body: PostBody);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode (response.body);

  if (ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    await WriteUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request fail! try again");
    return false;
  }
}



Future<bool> VerifyEmailRequest (Email) async{

  var URL=Uri.parse("${BaseURL}/RecoveryVerifyEmail/${Email}");


  var response= await http.get(URL,headers: RequestHeader);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode (response.body);

  if (ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail! try again");
    return false;
  }
}


Future<bool> VerifyOTPRequest (Email,OTP) async{

  var URL=Uri.parse("${BaseURL}/RecoveryVerifyOTP/${Email}/${OTP}");


  var response= await http.get(URL,headers: RequestHeader);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode (response.body);

  if (ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail! try again");
    return false;
  }
}


Future<bool> SetPasswordRequest (FormValues) async{

  var URL=Uri.parse("${BaseURL}/RecoverRequestPass");
  var PostBody=json.encode(FormValues);

  var response= await http.post(URL,headers: RequestHeader, body: PostBody);

  var ResultCode=response.statusCode;
  var ResultBody=json.decode (response.body);

  if (ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail! try again");
    return false;
  }
}
