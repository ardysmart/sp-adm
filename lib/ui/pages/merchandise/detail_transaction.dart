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
                ],
              ),
            ),
            Text("List Produk"),
            // BlocBuilder<DetailtransactionCubit, DetailtransactionState>(
            //   builder: (_, state) => (state is DetailtransactionLoaded)
            //       ? Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: state.detailtransactions
            //               .map(
            //                 (e) => Container(
            //                   decoration: BoxDecoration(
            //                       color: Colors.white,
            //                       boxShadow: [
            //                         BoxShadow(
            //                           color: Colors.black,
            //                           spreadRadius: 0,
            //                           blurRadius: 3,
            //                         ),
            //                       ]),
            //                   margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Container(
            //                         margin: EdgeInsets.fromLTRB(10, 20, 15, 20),
            //                         alignment: Alignment.centerLeft,
            //                         child: Row(
            //                           children: [
            //                             Container(
            //                                 child: Image.asset(
            //                               "assets/images/doc.png",
            //                               width: 45,
            //                             )),
            //                             Column(
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.start,
            //                               children: [
            //                                 Text("Dokumen :",
            //                                     style: TextStyle(
            //                                         fontSize: 12,
            //                                         color: Colors.black26)),
            //                                 Text(e.name,
            //                                     style: TextStyle(
            //                                         fontWeight: bold,
            //                                         fontSize: 16)),
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                       Container(
            //                         margin: EdgeInsets.only(right: 10),
            //                         child: InkWell(
            //                           child: Container(
            //                               child: Text(
            //                             "Lihat",
            //                             style: TextStyle(
            //                                 color: Colors.black, fontSize: 15),
            //                           )),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               )
            //               .toList(),
            //         )
            //       : SizedBox(
            //           height: 30,
            //         ),
            // )
          ],
        ),
      ),
    );
  }
}
