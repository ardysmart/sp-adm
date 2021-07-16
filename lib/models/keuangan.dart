part of 'models.dart';

class Keuangan extends Equatable {
  final int id;
  final int spadm_uk;
  final String periode;
  final String file;

  Keuangan({this.id, this.spadm_uk,this.periode, this.file});
  factory Keuangan.fromJson(Map<String, dynamic> data) =>
      Keuangan(id: data['id'],spadm_uk:data['spadm_uk'], periode: data['periode'], file: 'https://sp-adm.com/mom_Keuangan/' +data['pdf']);
  @override
  // TODO: implement props
  List<Object> get props => [id, spadm_uk,periode, file];
}
