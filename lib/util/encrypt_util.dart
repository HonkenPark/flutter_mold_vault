import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

String encryptInfo(String input) {
  if (input.isEmpty) {
    return '';
  }

  try {
    final key = Key.fromUtf8(dotenv.get('LOGIN_KEY'));
    final iv = IV.fromUtf8(dotenv.get('LOGIN_IV'));

    final encrypter = Encrypter(AES(key));
    String output = encrypter.encrypt(input, iv: iv).base64;
    return output;
  } catch (e) {
    Logger().e(e);
    return '';
  }
}

String decryptInfo(String input) {
  if (input.isEmpty) {
    return '';
  }

  try {
    final key = Key.fromUtf8(dotenv.get('LOGIN_KEY'));
    final iv = IV.fromUtf8(dotenv.get('LOGIN_IV'));
    final encrypter = Encrypter(AES(key));

    final decrypted = encrypter.decrypt(Encrypted.from64(input), iv: iv);
    return decrypted;
  } catch (e) {
    Logger().e(e);
    return '';
  }
}
