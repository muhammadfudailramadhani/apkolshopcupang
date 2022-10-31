import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/page/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:betta_fish/model/usermodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  late Future user;
  void initState() {
    user = ApiService()
        .getUser(  ); // memanggil API untuk mendapatkan data kategori  yang terdapat di API
    super.initState();
  }
 bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: scaffoldKey,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: user, // menampung data yang di dapat dari API
        builder: (context,
                AsyncSnapshot snapshot) // jika data belum di dapat dari API
            {
          if (snapshot.connectionState !=
              ConnectionState
                  .done) // jika connection state tidak sama dengan done
            return Center(
              child: CircularProgressIndicator(), // menampilkan loading
            );
          if (snapshot.hasError) // jika terdapat error
            return Center(
              child: Text("Error"), // menampilkan error
            );
          if (snapshot.hasData)
            return _build(snapshot
                .data); // jika data sudah di dapat dari API akan menampilkan halaman ini
          return Center(
            child: Text("kosong"),
          ); // jika tidak ada data yang di dapat dari API  menampilkan kosong
        },
      ),
    );
  }
  // ignore: unused_element

  Widget _build( UserModel data) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Icon(
                          AntDesign.arrowleft,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: height * 0.43,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.72,
                                  width: innerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                      ),
                                      Text(
                                        data.data.username,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(39, 105, 171, 1),
                                          fontFamily: 'Nunito',
                                          fontSize: 37,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'nomer telepon',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                              Text(
                                                data.data.phone.toString(),
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                              vertical: 8,
                                            ),
                                            child: Container(
                                              height: 50,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Role',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                              Text(
                                                data.data.role,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    height: innerHeight * 0.3,
                                    width: innerWidth * 0.2,
                                    child: Image.asset(
                                      'assets/images/profile1.png',
                                      width: innerWidth * 0.45,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Container(
                  //   height: height * 0.5,
                  //   width: width,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(30),
                  //     color: Colors.white,
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 15),
                  //     child: Column(
                  //       children: [
                  //         SizedBox(
                  //           height: 20,
                  //         ),
                  //         Text(
                  //           'My Orders',
                  //           style: TextStyle(
                  //             color: Color.fromRGBO(39, 105, 171, 1),
                  //             fontSize: 27,
                  //             fontFamily: 'Nunito',
                  //           ),
                  //         ),
                  //         Divider(
                  //           thickness: 2.5,
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Container(
                  //           height: height * 0.15,
                  //           decoration: BoxDecoration(
                  //             color: Colors.grey,
                  //             borderRadius: BorderRadius.circular(30),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Container(
                  //           height: height * 0.15,
                  //           decoration: BoxDecoration(
                  //             color: Colors.grey,
                  //             borderRadius: BorderRadius.circular(30),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
