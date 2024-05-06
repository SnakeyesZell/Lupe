import 'dart:convert';

class TripDto 
{
  final String creatorId;
  final String title;
  final String description;
  final DateTime date;
  final List<String> linkedUsers;
  final List<String> images;

  TripDto(
  {
    required this.creatorId,
    required this.title,
    required this.description,
    required this.date,
    required this.linkedUsers,
    required this.images,
  });

  factory TripDto.fromJson(Map<String, dynamic> json) => TripDto(
    creatorId   : json["creatorId"],
    title       : json["title"],
    description : json["description"],
    date        : DateTime.parse(json["date"]),
    linkedUsers : List<String>.from(json["linkedUsers"].map((x) => x)),
    images      : List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => 
  {
    "creatorId"   : creatorId,
    "title"       : title,
    "description" : description,
    "date"        : date.toIso8601String(),
    "linkedUsers" : List<dynamic>.from(linkedUsers.map((x) => x)),
    "images"      : List<dynamic>.from(images.map((x) => x)),
  };

  static TripDto tripDtoFromJson(String str) => TripDto.fromJson(json.decode(str));
  static String tripDtoToJson(TripDto data) => json.encode(data.toJson());
}
