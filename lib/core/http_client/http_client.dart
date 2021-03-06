abstract class HttpClient {
  Future<HttpAnswer> get(String url);
  Future<HttpAnswer> post(String url, {required Map<String, dynamic> body});
  Future<HttpAnswer> put(String url, {required dynamic body});
}

class HttpAnswer {
  final dynamic data;
  final int? statusCode;
  HttpAnswer({
    required this.data,
    required this.statusCode,
  });
}
