part of '../pages.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("List Transaction"),
          BlocBuilder<TransactionCubit, TransactionState>(
            builder: (_, state) => (state is TransactionLoaded)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.transactions
                        .map(
                          (e) => Container(
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0,
                                blurRadius: 3,
                              ),
                            ]),
                            margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 15, 20),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Image.asset(
                                        "assets/images/doc.png",
                                        width: 45,
                                      )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Dokumen :",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black26)),
                                          Text(e.merchandiseName,
                                              style: TextStyle(
                                                  fontWeight: bold,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    child: Container(
                                        child: Text(
                                      "Lihat",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    )),
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailtransactionPage(
                                                  transaction: Transaction(
                                                      id: e.id,
                                                      userName: e.userName,
                                                      quantity: e.quantity,
                                                      total: e.total,
                                                      status: e.status,
                                                      merchandiseName:
                                                          e.merchandiseName,
                                                      linkPembayaran:
                                                          e.linkPembayaran),
                                                )),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  )
                : SizedBox(
                    height: 30,
                  ),
          )
        ],
      ),
    );
  }
}
