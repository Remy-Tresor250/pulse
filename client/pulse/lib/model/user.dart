
import 'package:jwt_decode/jwt_decode.dart';

class User {
  final String token;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String location;

  User(this.token, this.firstName, this.lastName, this.email, this.phone, this.location);

  factory User.fromToken(Map<String, dynamic> token) {
    final String? authToken = token["token"];
    final Map<String, dynamic> claims = Jwt.parseJwt(authToken!);

    return User(
        authToken,
        claims["firstName"],
        claims["lastName"],
        claims["email"],
        claims["sub"],
        claims["location"]
    );
  }

}