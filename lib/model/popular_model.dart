import 'dart:convert';

PopularModel popularFromJson(String str) => PopularModel.fromJson(json.decode(str));

String popularToJson(PopularModel data) => json.encode(data.toJson());

class PopularModel {
    PopularModel({
        required this.data,
    });

    List<Datum> data;

    factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
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
        required this.totalBarang,
        required this.height,
        required this.weight,
        required this.age,
        required this.deskripsi,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String namaBarang;
    int harga;
    String fotoBarang;
    int totalBarang;
    String kategori;
    int height;
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
        height: json["height"],
        weight: json["weight"],
        age: json["age"],
        totalBarang: json["totalBarang"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_barang": namaBarang,
        "harga": harga,
        "foto_barang": fotoBarang,
        "totalbarang": totalBarang,
        "kategori": kategori,
        "height": height,
        "weight": weight,
        "age": age,
        "deskripsi": deskripsi,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
