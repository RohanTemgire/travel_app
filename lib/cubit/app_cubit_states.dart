import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable{

}

//every cubit app should have one inital state
//when we first create a cubit we should pass a state class or a stateFunction
// which is why we have the InitialState class
class InitialState extends CubitStates{
  @override
  // TODO: implement props
  // List<Object?> get props => throw UnimplementedError();
  List<Object?> get props => [
    // here you should put the data that should be changed
    //as states hold the data. and then these data should change and rebuilt the UI
    
  ];
}

//once the initalstate is done we want to trigger a new state that is the WelcomeState
class WelcomeState extends CubitStates{
  //this page is responsible for the welcome page of our app
  @override
  // TODO: implement props
  // List<Object?> get props => throw UnimplementedError();
  List<Object?> get props => [];
  
}