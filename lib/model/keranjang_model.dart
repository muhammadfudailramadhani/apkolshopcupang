// To parse required this JSON data, do
//
//     final keranjangModel = keranjangModelFromJson(jsonString);

import 'dart:convert';

KeranjangModel keranjangModelFromJson(String str) => KeranjangModel.fromJson(json.decode(str));

String keranjangModelToJson(KeranjangModel data) => json.encode(data.toJson());

class KeranjangModel {
    KeranjangModel({
        required this.data,
    });

    List<Datum> data;

    factory KeranjangModel.fromJson(Map<String, dynamic> json) => KeranjangModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.barangId,
        required this.namaBarang,
        required this.jumlah,
        required this.harga,
        required this.fotoBarang,
        required this.kategori,
        required this.height,
        required this.weight,
        required this.age,
        required this.deskripsi,
    });

    int id;
    int barangId;
    String namaBarang;
    int jumlah;
    int harga;
    String fotoBarang;
    String kategori;
    int height;
    int weight;
    int age;
    String deskripsi;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        barangId: json["barang_id"],
        namaBarang: json["nama_barang"],
        jumlah: json["jumlah"],
        harga: json["harga"],
        fotoBarang: json["foto_barang"],
        kategori: json["kategori"],
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "barang_id": barangId,
        "nama_barang": namaBarang,
        "jumlah": jumlah,
        "harga": harga,
        "foto_barang": fotoBarang,
        "kategori": kategori,
        "height": height,
        "weight": weight,
        "age": age,
        "deskripsi": deskripsi,
    };
}
