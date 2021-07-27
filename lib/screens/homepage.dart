import 'package:flutter/material.dart';
import 'package:flutter_api_project_02/blocs/api_bloc/api_bloc.dart';
import 'package:flutter_api_project_02/models/apimodels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // @override
  // void initState() {
  //   setState(() {
  //     apiBloc = BlocProvider.of<ApiBloc>(context);
  //     // apiBloc.add(ApiFetchEvent());
  //   });
  //   super.initState();
  // }
  // ApiBloc apiBloc;

  _valueSearching(value) {
    print(value);
  }

  bool isSearched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: !isSearched ? Text("Api Fetching") :
         TextField(
           decoration: InputDecoration(
               hintText: 'Search'
           ),
           onChanged: (value){
             _valueSearching(value);
           },
         ),
         centerTitle: false,
         actions: [
           GestureDetector(
               onTap: () {
                 setState(() {
                   this.isSearched = !this.isSearched;
                 });
           },
               child: !isSearched ? Icon(Icons.search) : Icon(Icons.cancel), ),
         ],
       ),
      body: Container(
        child: BlocBuilder<ApiBloc, ApiState>(
               builder: (context, state){
                 if (state is ApiLoadingState) {
                   return buildLoading();
                 } else if (state is ApiLoadedState) {
                   return ListView.builder(
                       itemCount: state.customer.length,
                       itemBuilder: (context, index){
                         return Card(
                           elevation: 1.0,
                           child: ListTile(
                             title: Text(state.customer[index].cuSName.toString()),
                           ),
                         );
                       }
                   );
                 } else {
                   return Center(child: Text('something went wrong'),);
                 }
               },
        ),
      ),
    );
  }
}


 buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
}

 buildList(List<Customer> customer) {
    return ListView.builder(
      itemCount: customer.length,
        itemBuilder: (context, index){
            return ListTile(
              title: Text(customer[index].cuSName),
            );
        }
    );
}

 errorUI(String message) {
     return Text(message, style: TextStyle(color: Colors.deepOrange, fontSize: 25),);
}

