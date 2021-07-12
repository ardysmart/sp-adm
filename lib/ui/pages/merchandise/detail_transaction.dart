part of '../pages.dart';

class DetailtransactionPage extends StatefulWidget {
  final Transaction transaction;
  DetailtransactionPage({this.transaction});

  @override
  _DetailtransactionPageState createState() => _DetailtransactionPageState();
}

class _DetailtransactionPageState extends State<DetailtransactionPage> {
  File pictureFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
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
