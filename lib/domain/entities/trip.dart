import 'dart:convert';
import 'package:lupe/domain/domain.dart';

class Trip 
{
  final String creatorId;
  final String title;
  final String description;
  final DateTime date;
  final List<LupeUser> linkedUsers;
  final List<String> images;

  Trip(
  {
    required this.creatorId,
    required this.title,
    required this.description,
    required this.date,
    required this.linkedUsers,
    required this.images,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
    creatorId   : json["creatorId"],
    title       : json["title"],
    description : json["description"],
    date        : DateTime.parse(json["date"]),
    linkedUsers : List<LupeUser>.from(json["linkedUsers"].map((x) => LupeUser.fromJson(x))),
    images      : List<String>.from(json["images"].map((x) => x)),
  );

  static Trip tripFromJson(String str) => Trip.fromJson(json.decode(str));
}
