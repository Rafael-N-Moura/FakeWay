import 'package:fake_way/core/http_client/http_client.dart';
import 'package:dio/dio.dart';

class DioImplementation extends HttpClient {
  final client = Dio();

  @override
  Future<HttpAnswer> get(String url) async {
    final response = await client.get(url);
    return HttpAnswer(data: response.data, statusCode: response.statusCode);
  }

  @override
  Future<HttpAnswer> post(String url, {required Map<String, dynamic> body}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
