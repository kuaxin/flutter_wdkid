import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wdkid/generated/json/base/json_convert_content.dart';
import 'package:flutter_wdkid/net/http_util.dart';

import 'bean/home_bean_entity.dart';

/// A [StatelessWidget] which uses:
/// * [bloc](https://pub.dev/packages/bloc)
/// * [flutter_bloc](https://pub.dev/packages/flutter_bloc)
/// to manage the state of a counter.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            home: BlocProvider(
              create: (_) => CounterBloc(),
              child: MCounterPage(),
            ),
          );
        },
      ),
    );
  }
}


class MCounterPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MCounterState();
  }

}



class MCounterState extends State<MCounterPage> {


  @override
  void initState() {
    context.bloc<CounterBloc>().add(CounterEvent.decrement);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc, HomeBeanEntity>(
        builder: (_, count) {
          return Center(
            child: ListView.builder(
              itemCount: count.words.length,
              padding: new EdgeInsets.all(5.0),
              itemExtent: 50.0,
              itemBuilder: (BuildContext context,int index) {
                return Text("${count.words[index].lessonEnTitle}");
              },),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.bloc<CounterBloc>().add(CounterEvent.increment),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.bloc<CounterBloc>().add(CounterEvent.decrement),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.brightness_6),
              onPressed: () => context.bloc<ThemeCubit>().toggleTheme(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.error),
              onPressed: () => context.bloc<CounterBloc>().add(null),
            ),
          ),
        ],
      ),
    );
  }
}



/// A [StatelessWidget] which demonstrates
/// how to consume and interact with a [CounterBloc].
//class CounterPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: const Text('Counter')),
//      body: BlocBuilder<CounterBloc, int>(
//        builder: (_, count) {
//          return Center(
//            child: Text('$count', style: Theme.of(context).textTheme.headline1),
//          );
//        },
//      ),
//      floatingActionButton: Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              child: const Icon(Icons.add),
//              onPressed: () =>
//                  context.bloc<CounterBloc>().add(CounterEvent.increment),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              child: const Icon(Icons.remove),
//              onPressed: () =>
//                  context.bloc<CounterBloc>().add(CounterEvent.decrement),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              child: const Icon(Icons.brightness_6),
//              onPressed: () => context.bloc<ThemeCubit>().toggleTheme(),
//            ),
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 5.0),
//            child: FloatingActionButton(
//              backgroundColor: Colors.red,
//              child: const Icon(Icons.error),
//              onPressed: () => context.bloc<CounterBloc>().add(null),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}

/// Event being processed by [CounterBloc].
enum CounterEvent {
  /// Notifies bloc to increment state.
  increment,

  /// Notifies bloc to decrement state.
  decrement
}

/// {@template counter_bloc}
/// A simple [Bloc] which manages an `int` as its state.
/// {@endtemplate}
class CounterBloc extends Bloc<CounterEvent, HomeBeanEntity> {
  /// {@macro counter_bloc}
  CounterBloc() : super(null);

  @override
  Stream<HomeBeanEntity> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:

        var hm = Map<String,dynamic>();
        hm["class_no"] = "1";
        var repResult = await HttpUtil.getInstance().get("service/nk/v1/list/my/attendance/sentence", param: hm);
        var data = repResult.data;
        var fromJsonAsT = JsonConvert.fromJsonAsT<HomeBeanEntity>(data);
        var length = fromJsonAsT.words.length;
        yield fromJsonAsT;
        break;
      case CounterEvent.increment:
        yield null;
        break;
      default:
        addError(Exception('unsupported event'));
    }
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
