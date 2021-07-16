part of 'services.dart';

class TransactionService {
  static Future<ApiReturnValue<Transaction>> createTransaction(
      userId, merchandiseId, qty, total,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURLApi + 'transaksi';
    var response = await client.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer ${User.token}'
        },
        body: jsonEncode(<String, String>{
          "user": userId,
          "merchandise": merchandiseId,
          "quantity": qty,
          "total": total
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);
    // Transaction value = Transaction.fromJson(data["data"][0]);
    return ApiReturnValue(
        message: "Checkout berhasil silahkan upload bukti pembayaran");
  }

  static Future<ApiReturnValue<List<Transaction>>> getTransaction(id,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURLApi + 'tampil_transaksi_peruser';
    var response = await client.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, String>{
          "id": id,
        }));
    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }
    var data = jsonDecode(response.body);
    List<Transaction> transaction =
        (data as Iterable).map((e) => Transaction.fromJson(e)).toList();
    return ApiReturnValue(value: transaction);
    //
    // return ApiReturnValue(message: "Wrong email or password");
  }

  static Future<ApiReturnValue<String>> uploadPhotoTransaction(
      String id, File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseURLApi + 'uploadphoto';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers['Content-Type'] = 'appliction/json'
        ..headers['Authorization'] = "Bearer ${User.token}";
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);
    request.fields['id'] = id;
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      // String responseBody = await response.stream.bytesToString();
      // var data = jsonDecode(responseBody);
      // String imagePath = data['data'][0];

      // return ApiReturnValue(value: imagePath);
      return ApiReturnValue(message: "uploading bukti success");
    } else {
      return ApiReturnValue(message: "uploading profile value failed");
    }
  }
}
