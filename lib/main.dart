import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wdkid/pages/home_app.dart';
import 'package:flutter_wdkid/pages/my_app.dart';
import 'package:flutter_wdkid/pages/observer/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MaterialApp(
    home: HomeApp(),
  ));
}
