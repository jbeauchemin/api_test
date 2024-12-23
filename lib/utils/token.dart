import 'package:corsac_jwt/corsac_jwt.dart';

const signature = 'jesuisunsecret';

class Token {
  static String generateToken(Map<String, dynamic> data) {
    final token = JWTBuilder()
      ..expiresAt = DateTime.now().add(Duration(days: 1))
      ..setClaim('data', data)
      ..getToken();

    final signer = JWTHmacSha256Signer(signature);
    final signedToken = token.getSignedToken(signer);

    return signedToken.toString();
  }

  static bool verifyToken(String token) {
    try {
      final jwt = JWT.parse(token);
      print(jwt);
      final isValid =
          JWTValidator().validate(jwt, signer: JWTHmacSha256Signer(signature));
      print(isValid);
      return isValid.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
