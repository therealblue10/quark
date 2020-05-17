import 'dart:convert';
import 'package:http/http.dart' as http;

class URLRequetClient {
  URLRequetClient(this.requestURL);

  final String requestURL;

  // GET HTTP request 
  Future<dynamic> getResponse() async {
    http.get(requestURL)
    .then((response) => jsonDecode(response.body))
    .catchError((error) => error);
  }
}
