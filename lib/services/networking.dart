import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.handle);

  final String handle;

  Future getData() async {
    http.Response response = await http
        .get("https://codeforces.com/api/user.info?handles=${handle ?? ''}");

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }
}
