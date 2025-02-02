import 'package:flutter_mold_vault/util/html_util.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Future<void> saveSecureStorage(String key, String value) async {
//   final secureStorage = FlutterSecureStorage();
//   try {
//     await secureStorage.write(key: key, value: value);
//   } catch (e) {
//     Logger().e('Error saving data: ${e.toString()}');
//   }
// }

// Future<String?> fetchSecureStorage(String key) async {
//   final secureStorage = FlutterSecureStorage();
//   dynamic allSecureStorageData = await secureStorage.readAll();
//   if (allSecureStorageData != null) {
//     allSecureStorageData!.forEach((k, v) {
//       if (k == key) {
//         if (v.isNotEmpty) {
//           return v;
//         }
//       }
//     });
//   }
//   return null;
// }

// Future<void> deleteSecureStorage(String key) async {
//   final secureStorage = FlutterSecureStorage();
//   dynamic allSecureStorageData = await secureStorage.readAll();
//   if (allSecureStorageData != null) {
//     await secureStorage.delete(key: key);
//     allSecureStorageData!.remove(key);
//   }
// }

void saveStorage(String key, String value) {
  if (key == 'token') {
    setSessionStorage(key, value);
  } else {
    setLocalStorage(key, value);
  }
}

String? fetchStorage(String key) {
  if (key == 'token') {
    return getSessionStorage(key);
  } else {
    return getLocalStorage(key);
  }
}

void deleteStorage(String key) {
  if (key == 'token') {
    clearSessionStorage(key);
  } else {
    clearLocalStorage(key);
  }
}
