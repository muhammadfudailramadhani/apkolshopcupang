import 'package:betta_fish/api_service.dart';
import 'package:betta_fish/model/transaksi_model.dart';
import 'package:betta_fish/page/proses%20pemesanan/transaksi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardTransaksi extends StatefulWidget {
  final data;
  CardTransaksi({required this.data});
  @override
  _CardTransaksiState createState() => _CardTransaksiState();
}

deleteKeranjang(id) async {
  Uri url = Uri.parse("$baseUrl/transaksi/delete/$id");
  SharedPreferences storage = await SharedPreferences.getInstance();
  headers["Authorization"] = "Bearer ${storage.getString("token")}";
  final res = await http.delete(url, headers: headers);
  if (res.statusCode == 200) {
    print("berhasil");
  } else {
    print(res.statusCode);
    print(res.body);
    print("gagal");
  }
}

class _CardTransaksiState extends State<CardTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
      child: Align(
        alignment: AlignmentDirectional(-0.40, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
          child: Container(
            width: 600,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xC2C0A3FF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.data.fotoBarang),
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.data.namaBarang,
                  style: TextStyle(
                    fontFamily: 'Roboto Condensed',
                    color: Color(0x58101213),
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60, 15, 20, 15),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xD8F98531),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 13, 15, 5),
                      child: Text(
                        widget.data.jumlah.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto Condensed',
                          fontSize: 20,
                        ),
                      ),
                    ),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            onPressed: () => Navigator.pop(context),
                          
                          ),
                          DialogButton(
                            child: Text(
                              "yes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            onPressed: () {
                              deleteKeranjang(widget.data.id);
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
        ),
      ),
    );
  }
}
