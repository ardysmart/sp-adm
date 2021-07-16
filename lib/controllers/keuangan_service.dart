part of 'services.dart';

class KeuanganService {
  static Future<ApiReturnValue<List<Keuangan>>> getLaporanKeuangan(String spadmKey,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURLApi + 'laporan_keuangan';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${User.token}"
      },body: jsonEncode(<String, String>{
          'spadm_uk': spadmKey,
        })
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }
    var data = jsonDecode(response.body);
    print(data);
    List<Keuangan> keuangan =
        (data["data"] as Iterable).map((e) => Keuangan.fromJson(e)).toList();
    return ApiReturnValue(value: keuangan);
    //
    // return ApiReturnValue(message: "Wrong email or password");
  }
}
