import 'package:http/http.dart' as http;

class CookieClient extends http.BaseClient {
  final String cookie;
  final http.Client inner;

  CookieClient(this.cookie, this.inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Cookie'] = cookie;
    return inner.send(request);
  }
}
