import 'dart:convert';

import 'package:betta_fish/model/kategori_model.dart';
import 'package:betta_fish/model/keranjang_model.dart';
import 'package:betta_fish/model/popular_model.dart';
import 'package:betta_fish/model/rekomedasi_model.dart';
import 'package:betta_fish/model/search_model.dart';
import 'package:betta_fish/model/transaksi_model.dart';
import 'package:betta_fish/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl =
    "http://192.168.0.152:5000"; // untuk localhost kita pakai ip addressnya localhost
Map<String, String> headers = {
  "Content-Type": "application/json",
  "Authorization": ""
}; // headers untuk localhost kita pakai ip addressnya localhost

class ApiService {
  Future kategori(String data) async {
    Uri url = Uri.parse(
        "$baseUrl/barang/get?category=$data"); // untuk mengambil data dari server berdasarkan kategori yang di pilih user
    SharedPreferences storage = await SharedPreferences
        .getInstance(); // untuk mengambil data dari storage local yang berisi token
    headers["Authorization"] = "Bearer ${storage.getString("token")}"; //
    final res = await http.get(url,
        headers: headers); // untuk mengambil data dari server
    if (res.statusCode == 200) // jika status code dari server sama dengan 200
    {
      return kategoriModelFromJson(
          res.body); // mengubah data dari json ke dalam model kategori model
    } else {
      return false;
    } // jika status code tidak sama dengan 200
  }

  Future search(String data) async {
    Uri url = Uri.parse(
        "$baseUrl/barang/get?search=$data"); // mengambil data dari server berdasarkan keyword yang di tulis user
    SharedPreferences storage = await SharedPreferences
        .getInstance(); //  untuk mengambil data dari storage local yang berisi token
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res =
        await http.get(url, headers: headers); // mengambil data dari server
    if (res.statusCode == 200) {
      return searchModelFromJson(
          res.body); // mengubah data dari json ke dalam model search model
    } else {
      return false;
    }
  }

  Future getTransaksi() async {
    Uri url = Uri.parse("$baseUrl/transaksi/get");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      return transaksiFromJson(res.body);
    } else {
      return false;
    }
  }

  Future keranjang() async {
    Uri url = Uri.parse("$baseUrl/keranjang/get");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      return keranjangModelFromJson(res.body);
    } else {
      return false;
    }
  }

  Future transaksi(idBarang, pesananId) async {
    Uri url = Uri.parse("$baseUrl/transaksi/create/$idBarang");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.post(url,
        body: jsonEncode({
          "pesanan_id": pesananId,
          "status_id": 1
        }), //  untuk mengirim data ke transaksi
        headers:
            headers); // untuk mengirim data ke transaksi berdasarkan id barang dan id pesanan yang di pilih user
    if (res.statusCode == 200) // jika status code dari server sama dengan 200
    {
      print("ok"); // untuk menampilkan data yang sudah di kirim
      print(res.statusCode); // untuk menampilkan status code dari server
      return true;
    } else {
      print("gagal"); // untuk menampilkan data yang gagal di kirim
      print(res.body);
      return false;
    } //jika status code tidak sama dengan 200
  }

  Future pesan(
      int id, String alamat, int jumlah, String nama, int total) async {
    Uri url = Uri.parse("$baseUrl/pesanan/create/$id");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.post(url,
        body: jsonEncode({
          "alamat": alamat,
          "jumlah": jumlah,
          "total": total,
          "nama": nama
        }), //  untuk mengirim data ke pesanan
        headers: headers);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body)["value"];
      transaksi(data["barang_id"], data["id"]);
      print(res.statusCode);
      return true;
    } else {
      return false;
    }
  }

  Future addToCart(int id,int total) async {
    Uri url = Uri.parse("$baseUrl/keranjang/add/$id");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.post(url,body: jsonEncode({
      "jumlah":total
    }), headers: headers);
    if (res.statusCode == 200) {
      print(res.statusCode);
      return true;
    } else {
      return false;
    }
  }

  Future popular() async {
    Uri url = Uri.parse("$baseUrl/barang/popular");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      return popularFromJson(res.body);
    } else {
      return false;
    }
  }

  Future rekomendasi() async {
    Uri url = Uri.parse("$baseUrl/barang/rekomendasi");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      return rekomendasiFromJson(res.body);
    } else {
      print(res.body);
      return false;
    }
  }
// mendapatkan data yg sedang login
  Future getUser() async {
    Uri url = Uri.parse("$baseUrl/user/get");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      return userModelFromJson(res.body);
    } else {
      print(res.body);
      return false;
    }
  }
  
}
