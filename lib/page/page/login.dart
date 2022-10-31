import 'dart:convert';

import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/page/page/home.dart';
import 'package:betta_fish/page/page/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = "";
  Future login() async {
    setState(() {
      isLoading = true;
    });
    Uri url = Uri.parse("$baseUrl/user/login");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.post(url,
        body:
            jsonEncode({"username": username.text, "password": password.text}),
        headers: headers);
    if (res.statusCode == 200) {
      print(res.statusCode);
      setState(() {
        isLoading = false;
      });
      var data = jsonDecode(res.body);
      storage.setString("token", data["token"]);
        Alert(
        context: context,
        type: AlertType.success,
        title: "Login Success",
        desc: "Selamat datang",
        buttons: [
          DialogButton(
            child: Text(
              "ok",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            })),
          )
        ],
      ).show();
    } else {
      var data = jsonDecode(res.body);
      setState(() {
        isLoading = false;
        Alert(
                context: context,
                type: AlertType.error,
                title: "Error",
                desc: data["message"])
            .show();
      });
      print(res.body);
      print("gagal");
    }
  }
  // Future login() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   Uri url = Uri.parse("$baseUrl/user/login");
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   headers["Authorization"] = "Bearer ${storage.getString("token")}";
  //   final res = await http.post(url,
  //       body:
  //           jsonEncode({"username": username.text, "password": password.text}),
  //       headers: headers);

  //   if (res.statusCode == 200) {
  //     setState(() {
  //       isLoading = false;
  //       //    Alert(
  //       //   context: context,
  //       //   type: AlertType.success,
  //       //   title: "Berhasil",
  //       //   desc: "Login Berhasil",
  //       //   buttons: [
  //       //     DialogButton(
  //       //       child: Text(
  //       //         "ok",
  //       //         style: TextStyle(color: Colors.white, fontSize: 14),
  //       //       ),
  //       //       onPressed: () =>
  //       //           Navigator.of(context)
  //       //     .pushReplacement(MaterialPageRoute(builder: (context) => Home()))
  //       //     )
  //       //   ],
  //       // ).show();
  //     });

  //     var data = jsonDecode(res.body);
  //     storage.setString("token", data["token"]);
  //   } else {
  //     var data = jsonDecode(res.body);
  //     setState(() {
  //       isLoading = false;
  //       if(username.text.isEmpty){
  //          Alert(context: context,desc: "username tidak boleh kosng");
  //         return;
  //       }
  //       Alert(
  //               context: context,
  //               type: AlertType.error,
  //               title: "Error",
  //               desc: data["message"])
  //           .show();
  //     });
  //     print(res.body);
  //     print("gagal");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFC0A3FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Align(
                alignment: AlignmentDirectional(0, -0.05),
                child: Container(
                  alignment: AlignmentDirectional(0.050000000000000044, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, -1),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 53,
                                color: Color(0xFF94E5D7),
                                offset: Offset(9, 18),
                                spreadRadius: 10,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [Color(0x56FFFFFF), Color(0xFF94E5D7)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(100),
                            ),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 78,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 257,
                        height: 268,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.transparent,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 80,
                      ),

                      //from

                      Column(
                        children: [
                          Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(105, 255, 255, 255),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 2, 0, 0),
                                  child: Container(
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/pesan.png',
                                        ).image,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 290,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(30),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 0, left: 10, right: 85),
                                    child: TextFormField(
                                      controller: username,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Enter your username',
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF979797),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            errorMessage == "user tidak ditemukan"
                                ? errorMessage
                                : "",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(105, 255, 255, 255),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
                              child: Container(
                                width: 20,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/password.png',
                                    ).image,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: 290,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 2, bottom: 0, left: 13, right: 85),
                                child: TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF979797),
                                    ),
                                  ),
                                  autofocus: false,
                                  obscureText: true,
                                  validator: (String? value) {
                                    if (value == '') {
                                      Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: "Password tidak boleh kosong",
                                      ).show();
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 0, left: 30, right: 0),
                              child: Container(
                                width: 30,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/mata.png',
                                    ).image,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        errorMessage == "password salah" ? errorMessage : "",
                        style: TextStyle(color: Colors.red),
                      ),
                      SizedBox(height: 60),
                      Container(
                        width: 450,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF700BEF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (username.text.isEmpty || password.text.isEmpty) {
                              Alert(
                                type: AlertType.error,
                                  context: context,
                                  desc: "username atau password tidak boleh kosong").show();
                              return;
                            }
                            login();
                          },
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register()));
                          },
                          child: Text(
                            "register",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
