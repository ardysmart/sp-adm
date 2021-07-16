part of 'models.dart';

class Dansosduk extends Equatable {
  final int id;
  final String name;
  final String namaTypeDansosdukSukacita;
  final String judulClaim;
  final int status;
  Dansosduk(
      {this.id,
      this.name,
      this.namaTypeDansosdukSukacita,
      this.judulClaim,
      this.status});
  factory Dansosduk.fromJson(Map<String, dynamic> data) => Dansosduk(
      id: data['id'],
      name: data['name'],
      namaTypeDansosdukSukacita: data['nama_type_dansosduk_sukacita'],
      judulClaim: data['judul_claim'],
      status: data['status']);
  @override
  // TODO: implement props
  List<Object> get props =>
      [id, name, namaTypeDansosdukSukacita, judulClaim, status];
}
