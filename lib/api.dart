import 'package:dio/dio.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _initializeInterceptor();
  }

  Future<void> _initializeInterceptor() async {
    _dio.options.baseUrl = 'https://api.clikgett.com/api/';
    _dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOjE0NzE2ODEsImlhdCI6MTczMTkxMTIwNywiZXhwIjoxNzYzNDQ3MjA3fQ.7g_FkmLJkxpBj8tVhLcDdbai8_Scr3Px8ZHVumwPMzI';
  }

  Dio get sendRequest => _dio;
}
