class AuthUserDto 
{
  final String email;
  final String name;
  final String imageUrl;
  final String id;

  AuthUserDto(
  {
    required this.email, 
    required this.name, 
    required this.id,
    this.imageUrl = '', 
  });
}