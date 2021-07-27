import 'package:flutter/material.dart';
import 'package:flutter_api_project_02/blocs/api_bloc/api_bloc.dart';
import 'package:flutter_api_project_02/screens/homepage.dart';
import 'package:flutter_api_project_02/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(apiService: ApiService())..add(ApiFetchEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}