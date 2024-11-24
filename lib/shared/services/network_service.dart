import 'package:http/http.dart' as http;

class NetworkService {
  Future<http.Response> getRequest(String url) async {
    return await http.get(Uri.parse(url));
  }

  Future<http.Response> postRequest(
      String url, Map<String, dynamic> body) async {
    return await http.post(Uri.parse(url), body: body);
  }

  // Add other network-related methods here
}
