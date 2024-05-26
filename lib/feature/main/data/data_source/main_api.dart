import 'package:cook_app/feature/main/data/model/author_model.dart';
import 'package:cook_app/feature/main/data/model/detail_recipe_model.dart';
import 'package:cook_app/feature/main/data/model/recipe_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'main_api.g.dart';

@RestApi(baseUrl: 'http://164.92.125.200:8080/api')
abstract class MainApi {
  factory MainApi(Dio dio) = _MainApi;

  @GET("/recipes/category")
  Future<HttpResponse<List<RecipeModel>>> getRecipes(
    @Header('Authorization') String token,
    @Query("category") String category,
  );
  @GET("/recipes/{id}")
  Future<HttpResponse<DetailRecipeModel>> getDetailRecipe(
    @Path("id") int id,
    @Header('Authorization') String token,
    @Query('userId') int userId,
  );

  @GET("/user/byId/{id}")
  Future<HttpResponse<AuthorModel>> getAuthor(
    @Path("id") int id,
    @Header('Authorization') String token,
  );

  @POST("/recipes/{id}/save")
  Future<void> saveRecipe(
    @Path("id") int id,
    @Header('Authorization') String token,
    @Query('userId') int userId,
  );

  @POST("/recipes/{id}/like")
  Future<void> likeRecipe(
    @Path("id") int id,
    @Header('Authorization') String token,
    @Query('userId') int userId,
  );

  @GET("/user/{id}/recipes")
  Future<HttpResponse<List<RecipeModel>>> getAuthorRecipes(
    @Header('Authorization') String token,
    @Path("id") int id,
  );

  @POST("/user/follow")
  Future<void> follow(
    @Header('Authorization') String token,
    @Query('followerId') int followerId,
    @Query('followingId') int followingId,
  );

  @GET("/user/isFollowing")
  Future<bool> isFollowing(
    @Header('Authorization') String token,
    @Query('followerId') int followerId,
    @Query('followingId') int followingId,
  );
}
