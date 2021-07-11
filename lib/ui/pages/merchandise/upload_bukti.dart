part of '../pages.dart';

class UploadBuktiTransaction extends StatefulWidget {
  final Transaction transaction;
  UploadBuktiTransaction({this.transaction});

  @override
  _UploadBuktiTransactionState createState() => _UploadBuktiTransactionState();
}

class _UploadBuktiTransactionState extends State<UploadBuktiTransaction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Test"),
    );
  }
}
