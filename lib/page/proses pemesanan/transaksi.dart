import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/model/transaksi_model.dart';
import 'package:betta_fish/page/components/CardTransaksi.dart';
import 'package:betta_fish/page/components/cardstatus.dart';
import 'package:betta_fish/page/page/home.dart';
import 'package:flutter/material.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Stream transaksi;
  @override
  void initState() {
    transaksi = Stream.periodic(Duration(seconds: 20))
        .asyncMap((event) => ApiService().getTransaksi());
    super.initState();
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
        stream: transaksi,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.active)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.hasError)
            return Center(
              child: Text("terjadi kesalahan"),
            );
          if (snapshot.hasData) return _builder(snapshot.data);
          return Center(
            child: Text("kosong"),
          );
        },
      ),
    );
  }

  Widget _builder(Transaksi data) {
    if(data.data.isEmpty) return Center(child: Text("kosong"),);
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
                  Cardstatus(
                    data: data.data,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Container(
                      width: 500,
                      height: 600,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: data.data
                            .map((data) => CardTransaksi(
                                  data: data,
                                ))
                            .toList(),
                      ),
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
                          "Rp ${data.data[0].total}",
                          style: TextStyle(
                            fontFamily: 'Merienda One',
                            fontSize: 30,
                          ),
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
    );
  }
}
