part of 'services.dart';

class DansosdukServices {
  static Future<ApiReturnValue<List<Dansosduk>>> getDansosduk(id,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURLApi + 'dansosdukperuser';
    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'Apllication/json',
          "Accept": 'Apllication/json',
          'Authorization': 'Bearer ${User.token}',
        },
        body: jsonEncode(<String, String>{
          "id": id,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }
    var data = jsonDecode(response.body);
    List<Dansosduk> dansosduk =
        (data as Iterable).map((e) => Dansosduk.fromJson(e)).toList();
    print(data);
    return ApiReturnValue(value: dansosduk);
  }
}
