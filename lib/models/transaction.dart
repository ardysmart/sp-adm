part of 'models.dart';

class Transaction extends Equatable {
  final int id;
  final String userName;
  final String merchandiseName;
  final String quantity;
  final String total;
  final String status;
  final String linkPembayaran;

  Transaction(
      {this.id,
      this.userName,
      this.merchandiseName,
      this.quantity,
      this.total,
      this.status,
      this.linkPembayaran});
  factory Transaction.fromJson(Map<String, dynamic> data) => Transaction(
        id: data["id"],
        userName: data["user"],
        merchandiseName: data["merchandise"],
        quantity: data["quantity"].toString(),
        total: data["total"].toString(),
        status: data["status"],
        linkPembayaran: data["link_pembayaran"],
      );

  @override
  List<Object> get props =>
      [id, userName, merchandiseName, quantity, total, status, linkPembayaran];
}
