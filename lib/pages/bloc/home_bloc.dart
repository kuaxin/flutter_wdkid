import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wdkid/generated/json/base/json_convert_content.dart';
import 'package:flutter_wdkid/net/http_util.dart';
import 'package:flutter_wdkid/pages/bean/home_bean_entity.dart';
import 'package:flutter_wdkid/pages/bean/word_bean_entity.dart';



enum CounterEvent {
  loadListData,
}

class HomeBloc extends Bloc<CounterEvent,WordBeanEntity> {
  HomeBloc() : super(null);

  @override
  Stream<WordBeanEntity> mapEventToState(CounterEvent event) async*{
    switch(event) {
      case CounterEvent.loadListData:
        var hm = Map<String,dynamic>();
        hm["tagType"] = "1";
        var repResult = await HttpUtil.getInstance().get("/api/v2/front/tag/getTagList", param: hm);
        var data = repResult.data;
        var fromJsonAsT = JsonConvert.fromJsonAsT<WordBeanEntity>(data);
        yield fromJsonAsT;
        break;
    }
  }


}