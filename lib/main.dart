import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cubit/app_cubit_logics.dart';
import './services/data_services.dart';
import './cubit/app_cubits.dart';
import './pages/navPages/main_page.dart';
import './pages/welcome_page.dart';
import './pages/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}
