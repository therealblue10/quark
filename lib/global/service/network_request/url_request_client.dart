import 'dart:convert';
import 'package:http/http.dart' as http;

class URLRequestClient {
  URLRequestClient(this.requestURL);

  final String requestURL;

  // GET HTTP request 
  Future<dynamic> getResponse() async {
    final response =  await http.get(requestURL);
    return jsonDecode(response.body);
  }
}
