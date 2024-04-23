import 'dart:convert';
import 'lupe_user.dart';

class Trip 
{
  final String id;
  final String title;
  final String description;
  final String date;
  final List<LupeUser> tripMates;
  final List<String> photos;

  Trip(
  {
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.tripMates,
    required this.photos,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
    id          : json["id"],
    title       : json["title"],
    description : json["description"],
    date        : json["date"],
    tripMates   : List<LupeUser>.from(json["tripMates"].map((x) => LupeUser.fromJson(x))),
    photos      : List<String>.from(json["photos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => 
  {
    "id"          : id,
    "title"       : title,
    "description" : description,
    "date"        : date,
    "tripMates"   : List<LupeUser>.from(tripMates.map((x) => x.toJson())),
    "photos"      : List<dynamic>.from(photos.map((x) => x)),
  };

  static Trip tripFromJson(String str) => Trip.fromJson(json.decode(str));
  static String tripToJson(Trip data) => json.encode(data.toJson());
}
