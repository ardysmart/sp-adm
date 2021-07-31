part of 'models.dart';

class DetailTransaction extends Equatable {
  final int id;
  final String name;
  final String harga;
  final String idTransaksi;
  final String jumlah;

  DetailTransaction({
    this.id,
    this.name,
    this.harga,
    this.idTransaksi,
    this.jumlah,
  });
  factory DetailTransaction.fromJson(Map<String, dynamic> data) =>
      DetailTransaction(
        id: data["id"],
        name: data["name"],
        harga: data["harga"],
        idTransaksi: data["idTransaksi"].toString(),
        jumlah: data["jumlah"].toString(),
      );

  @override
  List<Object> get props => [id, name, harga, idTransaksi, jumlah];
}
