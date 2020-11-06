import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loaders/color_loader_4.dart';
import 'package:flutter_app/models/api/LoginAPI.dart';
import 'package:flutter_app/models/model/LoginResponse.dart';
import 'package:flutter_app/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = "";
String password = "";

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State {
  Widget _widget, _widget1;

  login(BuildContext mainContext) async {
    print("Login");
    LoginAPI loginAPI = LoginAPI();

    LoginResponse res = await loginAPI.login(username, password);

    if (res != null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("accessToken", res.accessToken);
      sharedPreferences.setInt("employeeId", res.employeeId);
      sharedPreferences.setBool("isAdmin", res.admin);

      print("Bearer${sharedPreferences.get("accessToken")}");

      Navigator.of(mainContext).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeApp()), (route) => false);
    } else {
      print("Login Failed");
    }
  }

  @override
  void initState() {
    super.initState();
    _widget1 = Container(
      height: 50,
      width: 50,
    );
    _widget = SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white30,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Chào mừng trở lại,",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Đăng nhập để tiếp tục !",
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (text) => username = text,
                        decoration: InputDecoration(
                          labelText: "Tài khoản",
                          labelStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        onChanged: (text) => password = text,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Mật Khẩu",
                          labelStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Quên Mật Khẩu ?",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              _widget1 = Container(
                                height: size.height,
                                width: size.width,
                                color: Colors.black,
                                child: ColorLoader4(),
                              );
                            });
                            login(context);
                          },
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xffff5f6d),
                                  Color(0xffff5f6d),
                                  Color(0xffffc371),
                                ],
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                  maxWidth: double.infinity, minHeight: 50),
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Container(
                      //   height: 50,
                      //   width: double.infinity,
                      //   child: FlatButton(
                      //     onPressed: () {},
                      //     color: Colors.indigo.shade50,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(6),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: <Widget>[
                      //         Image.asset(
                      //           "images/facebook.png",
                      //           height: 18,
                      //           width: 18,
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text(
                      //           "Connect with Facebook",
                      //           style: TextStyle(
                      //               color: Colors.indigo,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "I'm a new user.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage(),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            _widget1,
          ],
        ),
      ),
    );
  }
}
