part of 'api_bloc.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();
}

class ApiFetchEvent extends ApiEvent {
  List<Object> get props => null;
}

