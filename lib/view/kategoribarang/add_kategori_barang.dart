import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:restapi/contoller/kategori_barang_controller.dart';
import 'package:restapi/model/kategori_barang_model.dart';
import 'package:restapi/view/kategoribarang/kategori_barang.dart';

class AddKategoriBarang extends StatefulWidget {
  const AddKategoriBarang({super.key});

  @override
  State<AddKategoriBarang> createState() => _AddKategoriBarangState();
}

class _AddKategoriBarangState extends State<AddKategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  String? nama;

  void addkategoriBarang() async {
    KategoriBarangModel kategoriBarang = KategoriBarangModel(nama: nama!);
    await kategoriBarangController.addKategoriBarang(kategoriBarang);
  }

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori Barang'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nama Kategori Barang',
                labelText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {
                nama = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  AddKategoriBarang();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KategoriBarang()));

                  var snackBar =
                      const SnackBar(content: Text('Data Berhasil Disimpan'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
