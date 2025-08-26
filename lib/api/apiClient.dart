import 'dart:convert';
import 'package:http/http.dart' as http;
import '../style/style.dart';

var BaseURL="https://task.teamrabbil.com/api/v1";
var RequestHeader={"Content-Type": "application/json"};


Future<bool> LoginRequest (FormValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FormValues);

  // DEBUG: API কলে পাঠানো Body প্রিন্ট করা
  print("Login Request URL: $URL");
  print("Login Request Body: $PostBody");

  try {
    var response= await http.post(URL,headers: RequestHeader, body: PostBody);

    var ResultCode=response.statusCode;
    var ResultBody=json.decode (response.body);

    // DEBUG: API থেকে আসা স্ট্যাটাস কোড এবং রেসপন্স বডি প্রিন্ট করা
    print("Login API Response Status Code: $ResultCode");
    print("Login API Response Body: $ResultBody");

    if (ResultCode==200 && ResultBody['status']=="success"){
      SuccessToast("Request Success");
      return true;
    }
    else{
      // DEBUG: যদি API ব্যর্থ হয়, তাহলে এর কারণ প্রিন্ট করা
      print("Login Failed: Status code not 200 or status not 'success'.");
      ErrorToast("Request fail! try again");
      return false;
    }
  } catch (e) {
    // DEBUG: যদি কোনো নেটওয়ার্ক বা পার্সিং এরর হয়, তা ধরা
    print("Error during LoginRequest: $e");
    ErrorToast("Network error or invalid response!");
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
