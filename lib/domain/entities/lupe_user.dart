class LupeUser 
{
  final String id;
  final String email;
  final String name;
  final String imageUrl;

  LupeUser(
  {
    required this.id,
    required this.email, 
    required this.name, 
    this.imageUrl = '', 
  });

  factory LupeUser.fromJson(Map<String, dynamic> json) => LupeUser(
    id       : json["id"],
    email    : json["email"],
    name     : json["name"],
    imageUrl : json["imageUrl"],
  );

  Map<String, dynamic> toJson() => 
  {
    "id"       : id,
    "email"    : email,
    "name"     : name,
    "imageUrl" : imageUrl,
  };
}
