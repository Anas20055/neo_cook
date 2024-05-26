// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final int id;
  final String? imagePath;
  final String name;
  final int recipesCount;
  final int followersCount;
  final int followingsCount;
  final String? bio;

  const AuthorEntity({
    required this.id,
    this.imagePath,
    required this.name,
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

  AuthorEntity copyWith({
    int? id,
    String? imagePath,
    String? name,
    int? recipesCount,
    int? followersCount,
    int? followingsCount,
    String? bio,
  }) {
    return AuthorEntity(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      recipesCount: recipesCount ?? this.recipesCount,
      followersCount: followersCount ?? this.followersCount,
      followingsCount: followingsCount ?? this.followingsCount,
      bio: bio ?? this.bio,
    );
  }
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