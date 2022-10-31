import 'dart:convert';

Transaksi transaksiFromJson(String str) => Transaksi.fromJson(json.decode(str));

String transaksiToJson(Transaksi data) => json.encode(data.toJson());

class Transaksi {
    Transaksi({
        required this.data,
    });

    List<Datum> data;

    factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.userId,
        required this.statusPemesanan,
        required this.barangId,
        required this.pesananId,
        required this.statusId,
        required this.jumlah,
        required this.total,
        required this.alamat,
        required this.fotoBarang,
        required this.namaBarang,
    });

    int id;
    int userId;
    String statusPemesanan;
    int barangId;
    int pesananId;
    int statusId;
    int jumlah;
    int total;
    String alamat;
    String fotoBarang;
    String namaBarang;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        statusPemesanan: json["status_pemesanan"],
        barangId: json["barang_id"],
        pesananId: json["pesanan_id"],
        statusId: json["status_id"],
        jumlah: json["jumlah"],
        total: json["total"],
        alamat: json["alamat"],
        fotoBarang: json["foto_barang"],
        namaBarang: json["nama_barang"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status_pemesanan": statusPemesanan,
        "barang_id": barangId,
        "pesanan_id": pesananId,
        "status_id": statusId,
        "jumlah": jumlah,
        "total": total,
        "alamat": alamat,
        "foto_barang": fotoBarang,
        "nama_barang": namaBarang,
    };
}
