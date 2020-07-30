import 'package:flutter_wdkid/util/uuid_create.dart';

class RepResult {

  var data;
  String trace_id;
  int errcode;
  String errmsg;

  RepResult(this.errcode, this.errmsg,{this.data = "",this.trace_id = ""});



  @override
  String toString() {
    return 'RepResult{data: $data, trace_id: $trace_id, errcode: $errcode, errmsg: $errmsg}';
  }
}