part of '../pages.dart';

class DetailtransactionPage extends StatefulWidget {
  final Transaction transaction;
  DetailtransactionPage({this.transaction});

  @override
  _DetailtransactionPageState createState() => _DetailtransactionPageState();
}

class _DetailtransactionPageState extends State<DetailtransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget rowDetail(field, value) {
    return Row(
      children: [
        Text(field),
        Spacer(),
        Text(value),
      ],
    );
  }

  Widget getBottom() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      child: FlatButton(
          color: primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    UploadBuktiTransaction(transaction: widget.transaction),
              ),
            );
          },
          child: Text(
            "Upload Bukti bayar",
            style: TextStyle(fontSize: 18, color: white),
          )),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 30),
                  rowDetail("Nama User", widget.transaction.userName),
                  SizedBox(height: 15),
                  rowDetail("Nama Barang", widget.transaction.merchandiseName),
                  SizedBox(height: 15),
                  rowDetail("Quantity", widget.transaction.quantity),
                  SizedBox(height: 15),
                  rowDetail("Total Price", widget.transaction.total)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
