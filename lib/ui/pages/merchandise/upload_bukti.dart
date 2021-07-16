part of '../pages.dart';

class UploadBuktiTransaction extends StatefulWidget {
  final Transaction transaction;
  UploadBuktiTransaction({this.transaction});

  @override
  _UploadBuktiTransactionState createState() => _UploadBuktiTransactionState();
}

class _UploadBuktiTransactionState extends State<UploadBuktiTransaction> {
  @override
  File pictureFile;

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
          onPressed: () async {
            await context.bloc<TransactionCubit>().uploadPhotoTransaction(
                widget.transaction.id.toString(), pictureFile);
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
        child: Column(
          children: [
            // Text("hello")
            GestureDetector(
              onTap: () async {
                PickedFile pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  pictureFile = File(pickedFile.path);
                  setState(() {});
                }
              },
              child: Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/border.png'))),
                child: (pictureFile != null)
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(pictureFile),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/photo.png'),
                                fit: BoxFit.cover)),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
