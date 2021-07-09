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

  const Payment(
      {Key key,
      this.id,
      this.name,
      this.code,
      this.img,
      this.price,
      this.promotionPrice,
      this.size,
      this.color})
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
          onPressed: () {
            // your add cart here
          },
          child: Text(
            "TRANSAKSI",
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
            SizedBox(
              height: 10,
            ),
            Text('HALAMAN TRANSAKSI')
            
            
          ],
        ),
      ),
    );
  }
}

