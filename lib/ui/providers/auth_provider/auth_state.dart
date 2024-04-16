part of 'auth_provider.dart';

class AuthState 
{
  final LupeUser? lupeUser;

  AuthState(
  {
    this.lupeUser,
  });

  AuthState copyWith(
  {
    LupeUser? lupeUser,
  })=> AuthState(
    lupeUser: lupeUser ?? this.lupeUser,
  );
}