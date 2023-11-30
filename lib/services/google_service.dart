import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleService {
  static final Logger _logger = Logger();
  static final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  static Future<bool> login() async {
    bool ok = false;
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication auth = await account.authentication;
        final String foto = account.photoUrl ?? '';
        final String nombre = account.displayName ?? '';
        final String email = account.email;
        final String idToken = auth.idToken ?? '';
        final String accessToken = auth.accessToken ?? '';
        ok = idToken.isNotEmpty && accessToken.isNotEmpty;
        if (ok) {
          await SharedPreferences.getInstance().then((sp) {
            sp.setString('foto', foto);
            sp.setString('nombre', nombre);
            sp.setString('email', email);
            sp.setString('idToken', idToken);
            sp.setString('accessToken', accessToken);
          });
        }
      }
    } catch (error, stackTrace) {
      ok = false;
      _logger.e("error: $error");
      _logger.d("stackTrace: $stackTrace");
    }
    return ok;
  }

  static Future<String> getData(final String key) async {
    String data = '';
    await SharedPreferences.getInstance().then((sp) {
      data = sp.getString(key) ?? '';
    });
    return data;
  }

  static Future<void> disconnect() async {
    try {
      await _googleSignIn.disconnect();
      _logger.i('Desconexión exitosa');
    } catch (error) {
      _logger.e('Error al desconectar: $error');
    }
  }
}
