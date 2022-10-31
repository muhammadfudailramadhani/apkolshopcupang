import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/model/popular_model.dart';
import 'package:betta_fish/model/rekomedasi_model.dart';
import 'package:betta_fish/page/components/Card2Row.dart';
import 'package:betta_fish/page/components/Card3row.dart';
import 'package:betta_fish/page/components/CardNavbar.dart';
// import 'package:betta_fish/page/components/CardAppbar.dart';
// import 'package:betta_fish/page/components/CardNavbar.dart';
// import 'package:betta_fish/page/components/CardNavbar2.dart';
import 'package:betta_fish/page/components/CardRow.dart';
import 'package:betta_fish/page/page/Search.dart';
import 'package:betta_fish/page/page/category.dart';
import 'package:betta_fish/page/page/profile.dart';
import 'package:betta_fish/page/proses%20pemesanan/keranjang.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:betta_fish/model/usermodel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var user;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List category = [
    "rosetail",
    "giant",
    "avatar",
    "koi",
    "halfmoon",
    "vancy",
    "Multicolor",
    "avatar",
    "plakat",
    "candy",
    "nemo",
    "red dragon"
  ];
  late Future rekomedasi;
  late Future
      popular; //untuk mengambil data dari API yang sudah dibuat di api_service.dart rekomendasi dan popular
  @override
  void initState() {
    rekomedasi = ApiService().rekomendasi();
    popular = ApiService()
        .popular(); // untuk mengambil data dari API dan mengirimkan ke model PopularModel dan RekomendasiModel
    user = ApiService().getUser();
    super.initState();
  }

  bool show = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [CardNavbar()],
        ),
      ),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Align(
            alignment: AlignmentDirectional(-1, -1),
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 3, 0, 0),
                  child: InkWell(
                    onTap: () {
                      
                      // Alert(
                      //     context: context,
                      //     // type: AlertType.success,
                      //     // title: "Profile",
                      //     content: Column(
                      //       children: [
                      //         Container(
                      //           height: 20,
                      //           width: 20,
                      //           child: Icon(
                      //             Icons.person,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.only(top: 20),
                      //           child: Text(
                      //             "M fudail fudail",
                      //             style: TextStyle(
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //         Text(
                      //           "0283746587",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ],
                      //     )
                      //     // buttons: [
                      //     //   DialogButton(
                      //     //     child: Text(
                      //     //       "ok",
                      //     //       style:
                      //     //           TextStyle(color: Colors.white, fontSize: 14),
                      //     //     ),
                      //     //     onPressed: () => Navigator.push(context,
                      //     //         MaterialPageRoute(builder: (context) {
                      //     //       return Keranjang();
                      //     //     })),
                      //     //   )
                      //     // ],
                      //     ).show();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
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
            show // agar container search tidak terlihat ketika halaman di load
                ? Row(
                    children: [
                      Container(
                        width: 300,
                        //border

                        child: TextField(
                          onSubmitted: (value) {
                            if (value.isEmpty) {
                              return;
                            } // agar tidak terjadi error ketika tidak mengisi data di textfield
                            else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Search(
                                        data: value,
                                      ))); // menampilkan halaman search  dengan data yang di inputkan  di textfield
                            }
                          }, // agar textfield tidak bisa diisi kosong dan tidak bisa di submit dengan tombol enter
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              show = false;
                            }); //ketika tombol close ditekan maka container search akan disembunyikan
                          },
                          icon: Icon(Icons.cancel))
                    ],
                  )
                : Align(
                    alignment: AlignmentDirectional(-1, -0.9),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(450, 12, 10, 0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            show = true;
                          }); // ketika di tekan maka container search akan ditampilkan  dan bisa di isi data
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0x00BB3F3F),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/search.png',
                              ).image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                          'assets/images/keranjang.png',
                        ).image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GestureDetector(
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
                    Align(
                      alignment: AlignmentDirectional(-1, -0.5),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 5, 0, 0),
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                fontFamily: 'Ovo',
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 30, right: 40),
                      child: Container(
                        height: 50,
                        width: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: category.map((data) {
                            return _categoryButton(
                                data); //untuk mengambil data dari list category dan mengirimkan ke _categoryButton untuk ditampilkan di halaman ini
                          }).toList(),
                        ),
                      ),
                    ), // untuk menampilkan kategori dari API yang sudah dibuat di api_service.dart category dan mengirimkan ke model CategoryModel

                    Align(
                      alignment: AlignmentDirectional(-1, -0.5),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 5, 0, 0),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                            child: Text(
                              'Recommended',
                              style: TextStyle(
                                fontFamily: 'Ovo',
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    FutureBuilder(
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done)
                          return CircularProgressIndicator(); //untuk menampilkan loading saat data dari API masih dalam proses pengambilan
                        if (snapshot.hasError)
                          return Text(
                              "terjadi kesalahan"); //untuk menampilkan error saat data dari API gagal dikirimkan
                        if (snapshot.hasData)
                          return _rekomendasiBuilder(snapshot.data,
                              width); //untuk menampilkan data dari API yang sudah dibuat di api_service.dart rekomendasi dan mengirimkan ke model RekomendasiModel dan mengirimkan ke _rekomendasiBuilder untuk ditampilkan di halaman ini
                        return Text(
                            "kosong"); //untuk menampilkan data kosong saat data dari API masih dalam proses pengambilan atau gagal dikirimkan
                      },
                      future: rekomedasi, //
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, -0.5),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 15, 0, 0),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                            child: Text(
                              'Popular',
                              style: TextStyle(
                                fontFamily: 'Ovo',
                                color: Colors.black,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    FutureBuilder(
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState != ConnectionState.done)
                          return CircularProgressIndicator(); // jika data belum ada maka akan menampilkan progress indicator atau loading
                        if (snapshot.hasError)
                          return Text(
                              "terjadi kesalahan"); // jika terdapat error maka akan menampilkan text error yang terjadi kesalahan
                        if (snapshot.hasData)
                          return _popularBuilder(snapshot.data, width);
                        return Text(
                            "kosong"); //jika data tidak ada maka akan menampilkan text kosong
                      }, //
                      future: popular,
                    ), // future builder untuk mengambil data dari api dan menampilkannya di halaman ini dengan menggunakan future builder
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String text) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(187, 206, 119, 26),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Category(
                        data: text,
                      )));
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 20),
            )));
  }

  Widget _popularBuilder(PopularModel data, width) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
      child: Container(
        height: width / 0.2,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
          child: CarouselSlider(
            options: CarouselOptions(
              
              height: 50,
              autoPlay: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.2 * 0.8,
              initialPage: 3,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.vertical
            ),
            items: data.data.asMap().entries.map((data) {
              return Row(
                children: [
                  Card2Row(
                    data: data.value,
                    i: data.key,
                  ), //datanya diambil dari data.value yang ada di PopularModel
                  Card3Row(
                    data: data.value,
                    i: data.key,
                  ),
                ],
              );
            }).toList(),
          ),

          // child: ListView(
          //   shrinkWrap: true,
          //   scrollDirection: Axis.vertical,
          //   children: data.data.asMap().entries.map((data) {
          //     return Row(
          //       children: [
          //         Card2Row(
          //           data: data.value,
          //           i: data.key,
          //         ), //datanya diambil dari data.value yang ada di PopularModel
          //         Card3Row(
          //           data: data.value,
          //           i: data.key,
          //         ),
          //       ],
          //     );
          //   }).toList(), //untuk mengambil data dari data.value yang ada di PopularModel
          // ),
        ),
      ),
    );
  } //mengambil data dari PopularModel dan menampilkan datanya dalam bentuk listview

  Widget _rekomendasiBuilder(Rekomendasi data, width) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 0, left: 40, right: 0),
      child: Container(
        height: width / 1.4,
        width: MediaQuery.of(context).size.width,

        child: CarouselSlider(
          options: CarouselOptions(
            // padEnds: true,
            height: width / 1.4,
            autoPlay: true,
            // aspectRatio: 15 / 9,
            viewportFraction: 0.3 * 1.5,
            initialPage: 3,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: data.data.asMap().entries.map((data) {
            return CardRow(
              data: data.value,
              i: data.key,
            );
          }).toList(),
        ),
        // child: ListView(
        //   shrinkWrap: true,
        //   scrollDirection: Axis.horizontal,
        //   children: data.data.asMap().entries.map(
        //       (data) //untuk mengambil data dari data.value yang ada di RekomendasiModel dan menampilkan datanya dalam bentuk listview dengan menggunakan map dan entries
        //       {
        //     return CardRow(
        //       data: data
        //           .value, //data diambil dari data.value yang ada di RekomendasiModel dan menampilkan data dari data.value yang ada di RekomendasiModel yang ada di api_service.dart Rekomendasi dan mengirimkan ke model RekomendasiModel
        //       i: data
        //           .key, //data diambil dari data.key yang ada di RekomendasiModel untuk mengambil index dari data yang ada di RekomendasiModel dan mengirimkan ke CardRow
        //     );
        //   }).toList(),
        // ),
      ),
    );
  }
}
