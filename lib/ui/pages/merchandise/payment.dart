part of '../pages.dart';

class Payment extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;
  final String promotionPrice;
  final List size;
  final List color;
  final int qty;

  const Payment(
      {Key key,
      this.id,
      this.name,
      this.code,
      this.img,
      this.price,
      this.promotionPrice,
      this.size,
      this.color,
      this.qty})
      : super(key: key);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int activeSize = 0;
  int activeColor = 0;
  String activeImg = '';
  int qty = 1;
  @override
  void initState() {
    //  implement initState
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      child: FlatButton(
          color: primary,
          onPressed: () async {
            var result = await context
                .bloc<TransactionCubit>()
                .createTransaction(
                    (context.bloc<UserCubit>().state as UserLoaded)
                        .user
                        .id
                        .toString(),
                    widget.id,
                    widget.qty.toString(),
                    (widget.qty * widget.price.toInt()).toString());
            await context.bloc<TransactionCubit>().getTransaction(
                (context.bloc<UserCubit>().state as UserLoaded)
                    .user
                    .id
                    .toString());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransactionPage()),
            );
          },
          child: Text(
            "TRANSAKSI",
            style: TextStyle(fontSize: 18, color: white),
          )),
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
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(width: 5.0, color: Colors.white),
                          image: DecorationImage(
                              image: NetworkImage(widget.img),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.name),
                            SizedBox(height: 10),
                            Text(widget.qty.toString() + ' x ' + widget.price)
                          ],
                        ),
                      ),
                      Spacer(),
                      Text((widget.qty * widget.price.toInt()).toString())
                    ],
                  ),
                  SizedBox(height: 30),
                  rowDetail("Nama Barang", widget.name),
                  SizedBox(height: 15),
                  rowDetail("Qty", widget.qty.toString()),
                  SizedBox(height: 15),
                  rowDetail("Price", widget.price),
                  SizedBox(height: 15),
                  rowDetail("Total Price",
                      (widget.qty * widget.price.toInt()).toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
