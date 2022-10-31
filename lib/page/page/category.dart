import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/model/kategori_model.dart';
// import 'package:betta_fish/page/components/CardAppbar.dart';
import 'package:betta_fish/page/components/CardNavbar.dart';
// import 'package:betta_fish/page/components/CardNavbar2.dart';
import 'package:betta_fish/page/components/Card2Row.dart';
import 'package:betta_fish/page/page/Search.dart';
import 'package:betta_fish/page/page/home.dart';
import 'package:betta_fish/page/proses%20pemesanan/keranjang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Category extends StatefulWidget {
  String data;
  Category({required this.data});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final scaffoldKey =
      GlobalKey<ScaffoldState>(); // scaffold key untuk menampilkan snackbar
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
  ]; // menampung data yang di dapat dari API  yg terdiri dari 12 kategori
  late Future kategori; // untuk menampung data yang di dapat dari API
  @override
  void initState() {
    kategori = ApiService().kategori(widget
        .data); // memanggil API untuk mendapatkan data kategori  yang terdapat di API
    super.initState();
  }

  bool show = false;
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
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: kategori, // menampung data yang di dapat dari API
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
            return _builder(snapshot
                .data); // jika data sudah di dapat dari API akan menampilkan halaman ini
          return Container(
            child: AlertDialog(
              title: Text("info",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 0, 0),
                  )),
              content: Text("Stock kosong"),
            ),
          );
        },
      ),
    );
  }

  Widget _builder(KategoriModel data) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // CardAppbar(),
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
            data.data.isEmpty // jika data kosong
                ? Container(
                    child: AlertDialog(
                      title: Text("info",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 0, 0),
                          )),
                      content: Text("Stock kosong"),
                    ),
                  ) //akan menampilkan kosong jika data kosong
                : StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 60,
                    children: data.data.asMap().entries.map(
                        (data) // mendapatkan data yang di dapat dari API maping ke dalam list
                        {
                      return Card2Row(
                        data: data
                            .value, // menampilkan data yang di dapat dari API
                        i: data.key,
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
