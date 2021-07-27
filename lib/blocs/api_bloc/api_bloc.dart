import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_project_02/models/apimodels.dart';
import 'package:flutter_api_project_02/services/api_service.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiService apiService;
  ApiBloc({@required this.apiService}) : super(ApiInitial());

  @override
  Stream<ApiState> mapEventToState(
    ApiEvent event,
  ) async* {
    if(event is ApiFetchEvent) {
      yield ApiLoadingState();
      try {
        List<Customer> customer = await apiService.getData();
        yield ApiLoadedState(customer: customer);
        print(customer);
      }  catch (e) {
        yield ApiErrorState(message: e.toString());
      }
    }
  }
}
