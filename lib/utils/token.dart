import 'package:corsac_jwt/corsac_jwt.dart';

const signature = 'nasjiodnsajdnaslo;dn;as';

class Token {
  static String generateToken(String kid) {
    final builder = new JWTBuilder();

    final signer = new JWTHmacSha256Signer(signature, kid: kid);
    final signedToken = builder.getSignedToken(signer);

    return signedToken.toString();
  }

  static bool verifyToken(String token) {
    try {
      final jwt = JWT.parse(token);

      final isValid =
          JWTValidator().validate(jwt, signer: JWTHmacSha256Signer(signature));

      return isValid.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
