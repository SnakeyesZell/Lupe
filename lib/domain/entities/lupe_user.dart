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
    email    : json["email"],
    name     : json["name"],
    imageUrl : json["imageUrl"],
    id       : json["id"],
  );

  Map<String, dynamic> toJson() => 
  {
    "email"    : email,
    "name"     : name,
    "imageUrl" : imageUrl,
    "id"       : id,
  };
}
