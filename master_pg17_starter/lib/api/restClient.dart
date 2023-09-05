import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:master_pg17_starter/commons/config.dart';
import 'package:master_pg17_starter/model/categorie.dart';

import '../model/response/CategorieResponse.dart';

part 'restClient.g.dart';

@RestApi(baseUrl: "${Config.BASE_URL}/api")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/categories")
  Future<CategorieResponse> getCategories();
}
