part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();
}

class ApiInitial extends ApiState {
  @override
  List<Object> get props => [];
}

class ApiLoadingState extends ApiState {
  @override
  List<Object> get props => [];
}

class ApiLoadedState extends ApiState {
  List<Customer> customer;
  ApiLoadedState({@required this.customer});
  @override
  List<Object> get props => [];
}

class ApiErrorState extends ApiState {
  String message;
  ApiErrorState({@required this.message});
  @override
  List<Object> get props => [];
}


