//this is the file which will hold our states and check them

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';

import './cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubicLogicsState();
}

class _AppCubicLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // we use blocBlder to perform checks
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (_, state) {
          // using this builder we can check on the states
          if (state is WelcomeState) {
            return WelcomePage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
