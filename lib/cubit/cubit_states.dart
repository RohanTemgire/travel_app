import 'package:bloc/bloc.dart';


import './app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits() : super(InitialState()){
    //since we dont have anything in the inital state so we need to emit a state
    emit(WelcomeState());
  } // every app has a inital cubit state, we need to pass it here


}