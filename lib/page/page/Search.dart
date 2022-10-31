import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/model/search_model.dart';
// import 'package:betta_fish/page/components/CardAppbar.dart';
import 'package:betta_fish/page/components/CardNavbar.dart';
// import 'package:betta_fish/page/components/CardNavbar2.dart';
import 'package:betta_fish/page/components/Card2Row.dart';
import 'package:betta_fish/page/page/home.dart';
import 'package:betta_fish/page/proses%20pemesanan/keranjang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  String data; // data yang di inputkan di textfield
  Search(
      {required this.data}); // untuk mengirimkan data yang di inputkan di textfield ke halaman ini
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final scaffoldKey =
      GlobalKey<ScaffoldState>(); // scaffold key untuk menampilkan snackbar
  late Future search; // untuk menampung data yang di dapat dari API
  @override
  void initState() {
    search = ApiService().search(widget.data);
    super.initState();
  }

  bool show = false; // untuk menampilkan loading

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [CardNavbar()],
        ),
      ),
      key: scaffoldKey, // untuk menampilkan snackbar
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: search,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState !=
              ConnectionState.done) // jika data belum di dapatkan dari API
            return Center(
              child: CircularProgressIndicator(),
            ); // menampilkan loading
          if (snapshot.hasError) // jika terdapat error
            return Center(
              child: Text("tejadi kesalahan"),
            ); // menampilkan text tejadi kesalahan
          if (snapshot.hasData)
            return _builder(
                snapshot.data, context); // jika data sudah di dapatkan dari API
          return Container(
            child: AlertDialog(
              title: Text("info",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    color: Colors.black,
                  )
              
              ),
              content: Text("tejadi kesalahan"),
            ),
            
          ); 
        },
      ), // sangat membantu developer untuk mengetahui setiap keadaan atau state yang terjadi pada sebuah proses
    );
  }
}

Widget _builder(SearchModel data, context) {
  return SafeArea(
    child: GestureDetector(
      onTap: () => FocusScope.of(context)
          .unfocus(), // ketika di klik di luar textfield maka textfield akan tidak terlihat
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                // menampilkan card appbar
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 60,
                  children: data.data
                      .asMap()
                      .entries
                      .map((data) //mendapatkan data dari API ke dalam listview
                          {
                    return Card2Row(
                      data: data.value,
                      i: data.key,
                    ); // menampilkan card2row dengan data yang didapatkan dari API
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
