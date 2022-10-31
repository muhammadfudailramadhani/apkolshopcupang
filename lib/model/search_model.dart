
import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    SearchModel({
        required this.data,
    });

    List<Datum> data;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.namaBarang,
        required this.harga,
        required this.fotoBarang,
        required this.kategori,
        required this.height,
        required this.weight,
        required this.age,
        required this.deskripsi,
        required this.createdAt,
        required this.updatedAt,
        required this.totalBarang
    });

    int id;
    String namaBarang;
    int harga;
    String fotoBarang;
    String kategori;
    int height;
    int totalBarang;
    int weight;
    int age;
    String deskripsi;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        namaBarang: json["nama_barang"],
        harga: json["harga"],
        fotoBarang: json["foto_barang"],
        kategori: json["kategori"],
        totalBarang: json["totalBarang"],
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_barang": namaBarang,
        "harga": harga,
        "foto_barang": fotoBarang,
        "kategori": kategori,
        "totalBarang": totalBarang,
        "height": height,
        "weight": weight,
        "age": age,
        "deskripsi": deskripsi,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
