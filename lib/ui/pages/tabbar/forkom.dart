part of '../pages.dart';

class Forkom extends StatefulWidget {
  @override
  _ForkomState createState() => _ForkomState();
}

class _ForkomState extends State<Forkom> {
  _launchURL(String url) async {
    var urlnew = url.replaceAll(' ', '%20');
    print(urlnew);
    if (await canLaunch(urlnew)) {
      await launch(urlnew);
    } else {
      throw 'Could not launch $urlnew';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<ForkomCubit, ForkomState>(
          builder: (_, state) => (state is ForkomLoaded)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.forkoms
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
                                          Text(e.judul,
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
                                      await _launchURL(e.file);
                                    },
                                  ),
                                ),
                              ],
                            )
                            // Column(
                            //   children: [
                            //     Text(e.name),
                            //     Text(e.date),
                            //     Text(e.place),
                            //     SizedBox(height: 20),
                            //   ],
                            // ),
                            ),
                        // Container(
                        //   color: Colors.yellow,
                        //       child: Column(
                        //         children: [
                        //           Text(e.id.toString()),
                        //           Text(e.judul),
                        // InkWell(
                        //   child: Container(
                        //       padding: EdgeInsets.only(top: 30),
                        //       child: Text(
                        //         "Daftar disini",
                        //         style: TextStyle(
                        //             color: Colors.black26,
                        //             fontSize: 11),
                        //       )),
                        //   onTap: () async {
                        //     await _launchURL(e.file);
                        //   },
                        // ),
                        //           SizedBox(height: 20),
                        //         ],
                        //       ),
                        //     )
                      )
                      .toList(),
                )
              : SizedBox(
                  height: 30,
                ),
        )
      ],
    );
  }
}
