import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/page/page/Search.dart';
import 'package:betta_fish/page/page/home.dart';
import 'package:betta_fish/page/proses%20pemesanan/keranjang.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailProduck extends StatefulWidget {
  final data;
  DetailProduck({this.data});
  @override
  _DetailProduckState createState() => _DetailProduckState();
}

class _DetailProduckState extends State<DetailProduck> {
  PageController pageViewController = PageController();
  int total = 1;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFC0A3FF),
        leading: Align(
          alignment: AlignmentDirectional(-1, -1),
          child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 3, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0x00B48F8F),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/logo.png',
                        ).image,
                      ),
                    ),
                  ),
                ),
              )),
        ),
        actions: [
          //
          Align(
            alignment: AlignmentDirectional(-1, -0.9),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40, 10, 20, 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Keranjang(),
                    ),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/keranjang2.png',
                      ).image,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 700,
                          height: 1100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 700,
                                height: 660,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC0A3FF),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(800),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Row(
                                    //   mainAxisSize: MainAxisSize.max,
                                    //   children: [
                                    //     Align(
                                    //       alignment:
                                    //           AlignmentDirectional(-1, -1),
                                    //       child: Padding(
                                    //           padding: EdgeInsetsDirectional
                                    //               .fromSTEB(10, 0, 0, 0),
                                    //           child: Padding(
                                    //             padding: EdgeInsetsDirectional
                                    //                 .fromSTEB(10, 3, 0, 0),
                                    //             child: InkWell(
                                    //               onTap: () {
                                    //                 Navigator.push(
                                    //                   context,
                                    //                   MaterialPageRoute(
                                    //                       builder: (context) =>
                                    //                           Home()),
                                    //                 );
                                    //               },
                                    //               child: Container(
                                    //                 width: 80,
                                    //                 height: 80,
                                    //                 decoration: BoxDecoration(
                                    //                   color: Color(0x00B48F8F),
                                    //                   image: DecorationImage(
                                    //                     fit: BoxFit.cover,
                                    //                     image: Image.asset(
                                    //                       'assets/images/logo.png',
                                    //                     ).image,
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           )),
                                    //     ),
                                    //     Padding(
                                    //       padding:
                                    //           EdgeInsetsDirectional.fromSTEB(
                                    //               430, 3, 0, 0),
                                    //       child: InkWell(
                                    //         onTap: () {
                                    //           Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   Keranjang(),
                                    //             ),
                                    //           );
                                    //         },
                                    //         child: Container(
                                    //           width: 50,
                                    //           height: 50,
                                    //           decoration: BoxDecoration(
                                    //             color: Color(0x00EEEEEE),
                                    //             image: DecorationImage(
                                    //               fit: BoxFit.cover,
                                    //               image: Image.asset(
                                    //                 'assets/images/keranjang2.png',
                                    //               ).image,
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.05, -0.15),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 35, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Container(
                                                  width: 310,
                                                  height: 620,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        0, 46, 8, 128),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0),
                                                      bottomRight:
                                                          Radius.circular(250),
                                                      topLeft:
                                                          Radius.circular(0),
                                                      topRight:
                                                          Radius.circular(0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Text(
                                                            'Betta Fish',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Marko One',
                                                                color: Color(
                                                                    0xA5FFFFFF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 25),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      20, 0, 0),
                                                          child: Text(
                                                            widget.data
                                                                .namaBarang,
                                                            style: TextStyle(
                                                              fontFamily: 'Ovo',
                                                              color: Color(
                                                                  0xC8FFFFFF),
                                                              fontSize: 60,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100,
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0.05),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        40,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Color',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Marko One',
                                                                  color: Color(
                                                                      0x80FFFFFF),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 30),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Multicolor',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Montaga',
                                                                  color: Color
                                                                      .fromARGB(
                                                                          119,
                                                                          182,
                                                                          1,
                                                                          198),
                                                                  fontSize: 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        20,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Harga',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Marko One',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Rp.${widget.data.harga}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Lora',
                                                                color: Color(
                                                                    0x90FF0000),
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 120,
                                                                  top: 20),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              height: 40,
                                                              width: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        157,
                                                                        255,
                                                                        225,
                                                                        0),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            65,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    blurRadius:
                                                                        4.0,
                                                                    spreadRadius:
                                                                        4.0,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            0),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      'stock:',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montaga',
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '${widget.data.totalBarang}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montaga',
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            157,
                                                                            50,
                                                                            0),
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        // membuat tombol tambah kurang beserta jumlahnya
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 40,
                                                              width: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            65,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    blurRadius:
                                                                        4.0,
                                                                    spreadRadius:
                                                                        4.0,
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            0.0),
                                                                  ),
                                                                ],
                                                                color: Color
                                                                    .fromARGB(
                                                                        157,
                                                                        255,
                                                                        225,
                                                                        0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          30),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          30),
                                                                ),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    total++;
                                                                    widget.data
                                                                        .totalBarang--;
                                                                  });
                                                                },
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    '+',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Montaga',
                                                                        color: Color(
                                                                            0x90FF0000),
                                                                        fontSize:
                                                                            24,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5),
                                                              child: Container(
                                                                height: 40,
                                                                width: 80,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              65,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      blurRadius:
                                                                          4.0,
                                                                      spreadRadius:
                                                                          4.0,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromARGB(
                                                                          157,
                                                                          255,
                                                                          225,
                                                                          0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    total
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Montaga',
                                                                        color: Color(
                                                                            0x90FF0000),
                                                                        fontSize:
                                                                            24,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5),
                                                              child: Container(
                                                                height: 40,
                                                                width: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Color
                                                                          .fromARGB(
                                                                              65,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      blurRadius:
                                                                          4.0,
                                                                      spreadRadius:
                                                                          4.0,
                                                                      offset: Offset(
                                                                          0.0,
                                                                          0.0),
                                                                    ),
                                                                  ],
                                                                  color: Color
                                                                      .fromARGB(
                                                                          157,
                                                                          255,
                                                                          225,
                                                                          0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            30),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            30),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            30),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            30),
                                                                  ),
                                                                ),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      if (total !=
                                                                          1) {
                                                                        total--;
                                                                        widget.data
                                                                            .totalBarang++;
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      '-',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Montaga',
                                                                          color: Color(
                                                                              0x90FF0000),
                                                                          fontSize:
                                                                              24,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Alert(
                                                                  context:
                                                                      context,
                                                                  type: AlertType
                                                                      .success,
                                                                  title:
                                                                      "Berhasil",
                                                                  desc:
                                                                      "Barang telah ditambahkan ke keranjang",
                                                                  buttons: [
                                                                    DialogButton(
                                                                      child:
                                                                          Text(
                                                                        "ok",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 14),
                                                                      ),
                                                                      onPressed: () => Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(builder:
                                                                              (context) {
                                                                        return Keranjang();
                                                                      })),
                                                                    )
                                                                  ],
                                                                ).show();
                                                                ApiService()
                                                                    .addToCart(
                                                                        widget
                                                                            .data
                                                                            .id,
                                                                        total);
                                                              },
                                                              child: Container(
                                                                width: 120,
                                                                height: 80,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00EEEEEE),
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: Image
                                                                        .asset(
                                                                      'assets/images/plus.png',
                                                                    ).image,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 0),
                                              child: Container(
                                                width: 255,
                                                height: 510,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00EEEEEE),
                                                  image: DecorationImage(
                                                    fit: BoxFit.scaleDown,
                                                    image: NetworkImage(
                                                        widget.data.fotoBarang),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 700,
                                height: 420,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.8, -0.1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 40, 0, 0),
                                        child: Text(
                                          'Detail',
                                          style: TextStyle(
                                            fontFamily: 'Advent Pro',
                                            color: Color(0xFFF98531),
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    150, 0, 0, 0),
                                            child: Container(
                                              width: 80,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, 0),
                                                    child: Text(
                                                      'Weight',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Advent Pro',
                                                        color:
                                                            Color(0x7E000000),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.9, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        '${widget.data.weight}cm',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Advent Pro',
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    60, 0, 0, 0),
                                            child: Container(
                                              width: 80,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -0.4, -0.3),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      child: Text(
                                                        'Lenght',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Advent Pro',
                                                          color:
                                                              Color(0x7D000000),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.9, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          '${widget.data.height}cm',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Advent Pro',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    60, 0, 0, 0),
                                            child: Container(
                                              width: 80,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, 0),
                                                    child: Text(
                                                      'Age',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Advent Pro',
                                                        color:
                                                            Color(0x7D050505),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.9, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        '${widget.data.age} Bulan',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Advent Pro',
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Row(
                                    //   mainAxisSize: MainAxisSize.max,
                                    //   children: [
                                    //     Container(
                                    //       width: 600,
                                    //       height: 245,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors.white,
                                    //         borderRadius:
                                    //             BorderRadius.circular(0),
                                    //       ),
                                    //       child: Container(
                                    //         width: 400,
                                    //         height: double.infinity,
                                    //         child: Stack(
                                    //           children: [
                                    //             PageView(
                                    //               controller:
                                    //                   pageViewController,
                                    //               scrollDirection:
                                    //                   Axis.horizontal,
                                    //               children: [
                                    //                 Image.asset(
                                    //                   'assets/images/ikan1.jpg',
                                    //                   width: 100,
                                    //                   height: 100,
                                    //                   fit: BoxFit.contain,
                                    //                 ),
                                    //                 Image.asset(
                                    //                   'assets/images/ikan2.jpg',
                                    //                   width: 100,
                                    //                   height: 100,
                                    //                   fit: BoxFit.contain,
                                    //                 ),
                                    //                 Image.asset(
                                    //                   'assets/images/ikan3.png',
                                    //                   width: 100,
                                    //                   height: 100,
                                    //                   fit: BoxFit.contain,
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             Align(
                                    //               alignment:
                                    //                   AlignmentDirectional(
                                    //                       0, 0.95),
                                    //               child: Padding(
                                    //                 padding:
                                    //                     EdgeInsetsDirectional
                                    //                         .fromSTEB(
                                    //                             0, 0, 0, 5),
                                    //                 child: SmoothPageIndicator(
                                    //                   controller:
                                    //                       pageViewController,
                                    //                   count: 3,
                                    //                   axisDirection:
                                    //                       Axis.horizontal,
                                    //                   onDotClicked: (i) {
                                    //                     pageViewController
                                    //                         .animateToPage(
                                    //                       i,
                                    //                       duration: Duration(
                                    //                           milliseconds:
                                    //                               500),
                                    //                       curve: Curves.ease,
                                    //                     );
                                    //                   },
                                    //                   effect:
                                    //                       ExpandingDotsEffect(
                                    //                     expansionFactor: 1.5,
                                    //                     spacing: 5,
                                    //                     radius: 15,
                                    //                     dotWidth: 30,
                                    //                     dotHeight: 10,
                                    //                     dotColor:
                                    //                         Color(0xFF9E9E9E),
                                    //                     activeDotColor:
                                    //                         Color(0xFFC0A3FF),
                                    //                     paintStyle:
                                    //                         PaintingStyle.fill,
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.7, -0.5),
                                            child: (Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              child: Text(
                                                'Description',
                                                style: TextStyle(
                                                  fontFamily: 'Advent Pro',
                                                  color: Color(0xFFF98531),
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            )),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    68, 30, 30, 0),
                                            child: Text(
                                              '${widget.data.deskripsi}',
                                              style: TextStyle(
                                                  fontFamily: 'Advent Pro',
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
