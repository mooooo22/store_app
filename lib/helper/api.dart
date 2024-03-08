import 'package:dio/dio.dart';

class Api {
  Future<Response> get(String url) async {
    final Dio dio = Dio();
    try {
      Response response = await dio.get(url);

      return response;
    } on DioException catch (e) {
      

      throw Exception(e.message);

    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
