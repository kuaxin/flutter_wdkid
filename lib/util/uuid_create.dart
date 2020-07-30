import 'package:uuid/uuid.dart';

class UUidFactory {
  static Uuid _uuid = Uuid();


  static String createUUid() {
    var v1 = _uuid.v1();
    var uuidStr = v1.replaceAll("-", "");
    return uuidStr;
  }


}