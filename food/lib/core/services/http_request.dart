import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic>? params,
      Interceptor? interceptor}) async {
    final options = Options(method: method);

    Interceptor inter = InterceptorsWrapper(onRequest: (options, handler) {
      handler.next(options);
    }, onResponse: (response, handler) {
      handler.next(response);
    }, onError: (error, handler) {
      handler.next(error);
    });

    List<Interceptor> inters = [inter];

    if (interceptor != null) {
      inters.add(interceptor);
    }

    dio.interceptors.addAll(inters);

    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
