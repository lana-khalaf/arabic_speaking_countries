import 'package:arabic_speaking_countries/models/country_model.dart';
import 'package:dio/dio.dart';

Future<List<Country>> getCountries() async {
  Dio dio = Dio();

  try {
    Response response = await dio.get("https://restcountries.com/v3.1/lang/arabic");
    
    if (response.statusCode == 200) {
      print('Response data: ${response.data}');
      
      List<Country> countries = (response.data as List)
          .map((json) => Country.fromMap(json))
          .toList();
          
      return countries;
    } else {
      print('Error Response: ${response.statusCode} - ${response.data}');
      return [];
    }
  } catch (e) {
    if (e is DioError) {
      print("DioError: ${e.message}");
      if (e.response != null) {
        print("DioError response data: ${e.response?.data}");
      }
    } else {
      print("Error: $e");
    }
    return [];
  }
}
