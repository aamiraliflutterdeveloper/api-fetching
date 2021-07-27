import 'dart:convert';
import 'package:flutter_api_project_02/models/apimodels.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Customer>> getData() async {
    final _url = "http://192.168.43.212/crud_bloc/db2.json";
    var response = await http.get(Uri.parse(_url));
    if(response.statusCode == 200) {
      // print('200');
      var data = json.decode(response.body);
      // print(data);
        List<Customer> customer = List<Customer>.from(json.decode(response.body)['customer'].map((x) => Customer.fromJson(x)));
        // print('===============  $customer');
        return customer;
      }
    else throw Exception('Failed to fetch');

  }
}
