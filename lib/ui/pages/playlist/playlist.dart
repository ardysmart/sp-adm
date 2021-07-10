part of '../pages.dart';

class Playlist extends StatefulWidget {
  Playlist({this.title, this.url});
  final String title;
  final String url;
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(widget.url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ListVideo(
                  list: snapshot.data,
                )
              : Container(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ));
        },
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new VideoPlay(url: "https://www.youtube.com/embed/${list[i]['contentDetails']['videoId']}",))),
            child: new Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  new Container(
                      height: 210,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(
                                list[i]['snippet']['thumbnails']['high']['url']),
                            fit: BoxFit.cover),
                      )),
                  new Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 1,
                    color: Color(0xffC0C0C0),
                    child: Text(
                      list[i]['snippet']['title'],
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
        
  }
}

class VideoPlay extends StatelessWidget {
  final String url;
  VideoPlay({this.url});
    @override
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(url: url),
      
    );
  }
}