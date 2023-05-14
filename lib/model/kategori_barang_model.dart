// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class KategoriBarangModel {
  final String nama;
  var id;
  KategoriBarangModel({
     this.id,
    required this.nama,
  });

  KategoriBarangModel copyWith({
    String? nama,
    int?id,
  }) {
    return KategoriBarangModel(
      id: id?? this.id,
      nama: nama ?? this.nama,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_kategori_barang' : id,
      'nama_kategori_barang': nama,

    };
  }

  factory KategoriBarangModel.fromMap(Map<String, dynamic> map) {
    return KategoriBarangModel(
      id: map['id_kategori_barang'] ?? 0,
      nama: map['nama_kategori_barang'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriBarangModel.fromJson(String source) =>
      KategoriBarangModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KategoriBarangModel(nama: $nama, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return  other is KategoriBarangModel && other.id == id && other.nama == nama;
  }

  @override
  int get hashCode => nama.hashCode;
}
