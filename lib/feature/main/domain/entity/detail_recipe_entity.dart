// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String difficulty;
  final bool liked;
  final bool saved;

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
    required this.difficulty,
    required this.liked,
    required this.saved,
  });

  @override
  // TODO: implement props
  List<Object> get props {
    return [
      id,
      imagePath,
      name,
      preparationTime,
      authorId,
      author,
      likes,
      description,
      ingredients,
      difficulty,
      liked,
      saved,
    ];
  }

  DetailRecipeEntity copyWith({
    int? id,
    String? imagePath,
    String? name,
    String? preparationTime,
    int? authorId,
    String? author,
    int? likes,
    String? description,
    List<Ingredient>? ingredients,
    String? difficulty,
    bool? liked,
    bool? saved,
  }) {
    return DetailRecipeEntity(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      preparationTime: preparationTime ?? this.preparationTime,
      authorId: authorId ?? this.authorId,
      author: author ?? this.author,
      likes: likes ?? this.likes,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      difficulty: difficulty ?? this.difficulty,
      liked: liked ?? this.liked,
      saved: saved ?? this.saved,
    );
  }
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
