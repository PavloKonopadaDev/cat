import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'services/service.g.dart';

@RestApi(baseUrl: "https://catfact.ninja/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("fact")
  Future<Map<String, dynamic>> getRandomCatFact();
}
