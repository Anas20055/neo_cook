class EditProfie {
  final String? editedName;
  final String? editedBio;
  final String? editedAvatarPath;
  EditProfie({
    this.editedName,
    this.editedBio,
    this.editedAvatarPath,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'editedName': editedName,
      'editedBio': editedBio,
      'editedAvatarPath': editedAvatarPath,
    };
  }

  factory EditProfie.fromJson(Map<String, dynamic> map) {
    return EditProfie(
      editedName:
          map['editedName'] != null ? map['editedName'] as String : null,
      editedBio: map['editedBio'] != null ? map['editedBio'] as String : null,
      editedAvatarPath: map['editedAvatarPath'] != null
          ? map['editedAvatarPath'] as String
          : null,
    );
  }
}
