import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/services/data_services.dart';


import './app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    //since we dont have anything in the inital state so we need to emit a state
    emit(WelcomeState());
  } // every app has a inital cubit state, we need to pass it here
  
  final DataServices data;
  late final places;
  void getData() async{
    try{
      emit(loadingState());
      places = await data.getInfo();//getinfo is loading all the information from the server
      emit(LoadedState(places));
    }catch(e){
      print(e);
    }
  }
}