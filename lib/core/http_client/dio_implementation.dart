import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/http_client/http_client.dart';
import 'package:dio/dio.dart';

class DioImplementation extends HttpClient {
  final client = Dio();

  @override
  Future<HttpAnswer> get(String url) async {
    try {
      final response = await client.get(url);
      return HttpAnswer(data: response.data, statusCode: response.statusCode);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<HttpAnswer> post(String url,
      {required Map<String, dynamic> body}) async {
    //final response = await client.post(url, data: body);
    //return HttpAnswer(data: body, statusCode: response.statusCode);
    throw UnimplementedError();
  }

  @override
  Future<HttpAnswer> put(String url, {required dynamic body}) async {
    try {
      final response = await client.put(url, data: body);
      return HttpAnswer(data: body, statusCode: response.statusCode);
    } catch (e) {
      throw ServerException();
    }
  }
}
