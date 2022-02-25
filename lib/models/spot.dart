class Spot {
  Spot(
      {required this.id,
      required this.createdAt,
      required this.authorId,
      required this.placeId,
      required this.description,
      required this.defaultPhotoUrl,
      required this.authorUsername,
      required this.authorFullName,
      required this.photoUrls,
      required this.authorPhotoUrl,
      required this.numberOfLikes,
      this.placeLogoUrl,
      required this.tags_,
      required this.placeName,
      required this.categoryDisplayName,
      required this.placeLocationName});

  factory Spot.fromJson(Map<String, dynamic> jsonSpot) {
    return Spot(
      id: jsonSpot['id'],
      createdAt: jsonSpot['createdAt'],
      authorId: jsonSpot['authorId'],
      placeId: jsonSpot['placeId'],
      description: jsonSpot['description'],
      defaultPhotoUrl: jsonSpot['defaultPhotoUrl'],
      authorUsername: jsonSpot['authorUsername'],
      authorFullName: jsonSpot['authorFullName'],
      photoUrls: List.from(jsonSpot['photoUrls']),
      authorPhotoUrl: jsonSpot['authorPhotoUrl'],
      numberOfLikes: jsonSpot['numberOfLikes'],
      placeLogoUrl: jsonSpot['placeLogoUrl'],
      tags_: List<Tag>.from(jsonSpot['tags_'].map((element) => Tag.fromJson(element))),
      placeName: jsonSpot['placeName'],
      categoryDisplayName: jsonSpot['categoryDisplayName'],
      placeLocationName: jsonSpot['placeLocationName'],
    );
  }

  final String id;
  final String createdAt;
  final String authorId;
  final String placeId;
  final String description;
  final String defaultPhotoUrl;
  final String authorUsername;
  final String authorFullName;
  final List<String> photoUrls;
  final String authorPhotoUrl;
  final int numberOfLikes;
  final String? placeLogoUrl;
  final List<Tag> tags_;
  final String placeName;
  final String categoryDisplayName;
  final String placeLocationName;
}

class Tag {
  Tag({required this.id, required this.name});

  factory Tag.fromJson(Map<String, dynamic> jsonTag) {
    return Tag(
      id: jsonTag['id'],
      name: jsonTag['name'],
    );
  }

  final int id;
  final String name;
}
