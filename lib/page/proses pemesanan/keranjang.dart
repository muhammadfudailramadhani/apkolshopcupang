import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/model/keranjang_model.dart';
// import 'package:betta_fish/page/components/Cardkeranjang.dart';
import 'package:betta_fish/page/page/home.dart';
import 'package:betta_fish/page/proses%20pemesanan/pemesanan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Stream keranjang;
  int total = 0;

  @override
  void initState() {
    keranjang = Stream.periodic(Duration(
            seconds: 13)) // untuk mengambil data dari api setiap 3 detik
        .asyncMap((event) => ApiService().keranjang());

    super.initState();
  }

  deleteKeranjang(id) async {
    Uri url = Uri.parse("$baseUrl/keranjang/delete/$id");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.delete(url, headers: headers);
    if (res.statusCode == 200) {
      AlertDialog();
    } else {
      print(res.statusCode);
      print(res.body);
      print("gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/kembali.png',
                  ).image,
                ),
              ),
            ),
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(190, 5, 0, 0),
            child: Container(
              width: 160,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: Align(
                alignment: AlignmentDirectional(-0.25, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                  child: Text(
                    'Transaksi',
                    style: TextStyle(
                      fontFamily: 'Merienda One',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: StreamBuilder(
        builder: (context, AsyncSnapshot snaphot) {
          if (snaphot.connectionState != ConnectionState.active)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snaphot.hasError)
            return Center(
              child: Text("terjadi kesalahan"),
            );
          if (snaphot.hasData) return _builder(snaphot.data);
          return Center(
            child: Text("kosong"),
          );
        },
        stream: keranjang,
      ),
    );
  }

  Widget _builder(KeranjangModel data) {
    print(data);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 600,
              height: 934,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 600,
                    child: ListView.builder(
                      itemCount: data.data.length,
                      itemBuilder: (context, index) {
                        // setState(() {
                        //   total+= total + data.data[index].harga ;
                        // });
                        return Container(
                          width: 400,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: Container(
                              width: 500,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFFC0A3FF),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 0, 5),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                                data.data[index].fotoBarang)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 170,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              data.data[index].namaBarang,
                                              style: TextStyle(
                                                fontFamily: 'Roboto Condensed',
                                                color: Color(0x97FFFFFF),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, -0.2),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 27, 0, 0),
                                            child: Text(
                                              'Rp. ${data.data[index].harga}',
                                              style: TextStyle(
                                                fontFamily: 'Montaga',
                                                color: Color(0xA1FF0000),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    data.data[index].jumlah++;
                                                    total += data
                                                            .data[index].harga *
                                                        data.data[index].jumlah;
                                                  });
                                                },
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/pluss.png',
                                                      ).image,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(13, 0, 10, 0),
                                                child: Text(
                                                  data.data[index].jumlah
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {

                                                  setState(() {
                                                    if (data.data[index]
                                                            .jumlah ==
                                                        1) //jika jumlah = 1 maka tidak bisa di kurangi
                                                    {
                                                      return;
                                                    } else {
                                                      data.data[index].jumlah--;
                                                      total -= data.data[index]
                                                              .harga *
                                                          data.data[index]
                                                              .jumlah;
                                                    }// jika jumlah > 1 maka bisa di kurangi
                                                  }); // untuk menghapus item dari keranjang dan menghitung total harga yang dibeli dari keranjang yang dihapus dan mengubah total harga yang dibeli menjadi 0 jika jumlah item di keranjang menjadi 0
                                                },
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/minus.png',
                                                      ).image,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Alert(
                                                context: context,
                                                type: AlertType.warning,
                                                title: "Hapus Item",
                                                desc:
                                                    "Apakah anda yakin ingin menghapus item ini dari keranjang?",
                                                buttons: [
                                                  DialogButton(
                                                    child: Text(
                                                      "tidak",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context),
                                                  ),
                                                  DialogButton(
                                                    child: Text(
                                                      "yes",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    ),
                                                    onPressed: () {
                                                      deleteKeranjang(
                                                          data.data[index].id);
                                                          Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              ).show();
                                           
                                            },
                                            icon: Icon(Icons.delete))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(60, 30, 0, 0),
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: 'Merienda One',
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(80, 30, 0, 0),
                        child: Text(
                          'Rp. ${total.toString()}',
                          style: TextStyle(
                            fontFamily: 'Merienda One',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Container(
                        width: 450,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF700BEF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Pemesanan(data: data, total: total)),
                          );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//deleteKeranjang(data.data[index].id);