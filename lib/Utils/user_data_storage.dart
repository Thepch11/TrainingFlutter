
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserDataStorage {
  final tokenKey = 'LoggedIn';

  // Create storage
  final storage = const FlutterSecureStorage();

  Future<bool> saveUserLogIn() async {
    await storage.write(key: tokenKey, value: '1');
    return true;
  }

  Future<bool> isUserLoggedIn() async {
    // Read value
    String? value = await storage.read(key: tokenKey);
    if (value != null && value == '1') {
      return true;
    }
    return false;
  }

  Future<bool> logOut() async {
    //delete
    await storage.delete(key: tokenKey);
    return true;
  }
}
