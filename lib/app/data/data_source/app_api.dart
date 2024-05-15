import 'package:cook_app/feature/auth/data/model/token_model.dart';
import 'package:cook_app/feature/auth/domain/entity/auth_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: 'http://164.92.125.200:8080/api')
abstract class AppApi {
  factory AppApi(Dio dio) = _AppApi;

  @POST("/authentication/login")
  Future<HttpResponse<TokenModel>> login(@Body() LoginRequest body);

  @POST("/authentication/register")
  Future<String> register(@Body() RegisterRequest body);
}
