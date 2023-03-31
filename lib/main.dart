import 'package:cat_fact_2/bloc/bloc.dart';
import 'package:cat_fact_2/repository/repository.dart';
import 'package:cat_fact_2/screens/history_screen.dart';
import 'package:cat_fact_2/screens/home_screen.dart';
import 'package:cat_fact_2/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:dio/dio.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('cat_facts');
  Dio dio = Dio();
  ApiService apiService = ApiService(dio);
  runApp(MyApp(apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  MyApp(this.apiService);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      home: BlocProvider(
        create: (context) => CatBloc(CatRepository(apiService)),
        child: HomeScreen(),
      ),
      routes: {
        '/history': (context) => FactHistoryScreen(),
      },
    );
  }
}
