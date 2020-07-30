
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wdkid/pages/bean/home_bean_entity.dart';
import 'package:flutter_wdkid/pages/bean/word_bean_entity.dart';
import 'package:flutter_wdkid/pages/bloc/home_bloc.dart';

class HomeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
//    return MaterialApp(
//      theme: ThemeData(
//        cardColor: Colors.blue,
//      ),
//      home: MHomePage(),
//    );ying'xi
    return BlocProvider(
        create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
                  theme: theme,
                  home: BlocProvider(
                    create:(_)=> HomeBloc(),
                    child: MHomePage(),
                  ),
              );
      }),
    );
  }

}



class MHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _MHomeState();
  }
}

class _MHomeState extends State<MHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    context.bloc<HomeBloc>().add(CounterEvent.loadListData);
//    getHttp();
    super.initState();

  }


  void getHttp() async {
    var hm = HashMap<String,dynamic>();
    hm["tagType"] = "1";

//    var response = await ().get("https://api.wdkid.com.cn/api/v2/front/tag/getTagList?tagType=1");
//    print("${response.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('这是App',style: TextStyle(fontSize: ScreenUtil().setSp(20.0))),
      ),
      body: BlocBuilder<HomeBloc,WordBeanEntity>(
        builder: (_, homeBean) {
          if(homeBean == null) {
            return Center(
              child: Text("没有数据"),
            );
          } else {
            return ListView.builder(itemBuilder: (BuildContext context,int index) {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(50),
                  child: Text(homeBean.data[index].chName),
                )
              );
            },
              itemCount: homeBean.data.length,
            );
          }
        },
      ),
    );
  }


}


/// {@template brightness_cubit}
/// A simple [Cubit] which manages the [ThemeData] as its state.
/// {@endtemplate}
class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}