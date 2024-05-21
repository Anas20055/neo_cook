import 'package:equatable/equatable.dart';

class DetailRecipeEntity extends Equatable {
  final int id;
  final String imagePath;
  final String name;
  final String preparationTime;
  final int authorId;
  final String author;
  final int likes;
  final String description;
  final List<Ingredient> ingredients;

  const DetailRecipeEntity({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.preparationTime,
    required this.authorId,
    required this.author,
    required this.likes,
    required this.description,
    required this.ingredients,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        imagePath,
        name,
        preparationTime,
        authorId,
        author,
        likes,
        description,
        ingredients
      ];
}

class Ingredient extends Equatable {
  final String key;
  final String value;

  const Ingredient({
    required this.key,
    required this.value,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        key,
        value,
      ];
}
