import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final int id;
  final String imagePath;
  final String name;
  final String author;
  final int likes;
  final int saves;

  const RecipeEntity({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.author,
    required this.likes,
    required this.saves,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        imagePath,
        name,
        author,
        likes,
        saves,
      ];
}
