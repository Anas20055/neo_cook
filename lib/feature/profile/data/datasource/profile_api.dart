import 'dart:io';

import 'package:cook_app/feature/main/data/model/author_model.dart';
import 'package:cook_app/feature/main/data/model/recipe_model.dart';
import 'package:cook_app/feature/profile/domain/entity/edit_profile.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: 'http://164.92.125.200:8080/api')
abstract class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET("/user/byId/{id}")
  Future<HttpResponse<AuthorModel>> getAuthor(
    @Path("id") int id,
    @Header('Authorization') String token,
  );

  @GET("/user/{id}/recipes")
  Future<HttpResponse<List<RecipeModel>>> getAuthorRecipes(
    @Header('Authorization') String token,
    @Path("id") int id,
  );

  @GET("/user/{id}/saved")
  Future<HttpResponse<List<RecipeModel>>> getAuthorSaved(
    @Header('Authorization') String token,
    @Path("id") int id,
  );

  @PUT("/api/user/{id}/edit")
  Future<String> editProfile(
    @Header('Authorization') String token,
    @Path("id") int id,
    @Body() EditProfie editProfie,
  );

  @POST("/api/user/uploadUserImage")
  Future<String> loadImage(
    @Header('Authorization') String token,
    @Part() File image,
  );
}
