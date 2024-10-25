import 'package:dio/dio.dart';
import '../constants/strings.dart';

class ApiServices {
  late Dio dio;

  ApiServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: kBaseUrl,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      // print("forom Dio =======>>>>>${response.data.toString()}");
      return response.data;
    } catch (e) {
      // print('========>>>>>>>>>>>${e.toString()}');
      return [];
    }
  }
}
