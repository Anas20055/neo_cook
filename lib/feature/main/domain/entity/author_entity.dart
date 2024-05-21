import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final int id;
  final String? imagePath;
  final String? name;
  final int recipesCount;
  final int followersCount;
  final int followingsCount;
  final String? bio;

  const AuthorEntity({
    required this.id,
    this.imagePath,
    this.name,
    required this.recipesCount,
    required this.followersCount,
    required this.followingsCount,
    this.bio,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        imagePath,
        name,
        recipesCount,
        followersCount,
        followingsCount,
        bio,
      ];
}

// {
//   "id": 4,
//   "imagePath": null,
//   "name": null,
//   "recipesCount": 0,
//   "followersCount": 0,
//   "followingsCount": 0,
//   "bio": null
// }