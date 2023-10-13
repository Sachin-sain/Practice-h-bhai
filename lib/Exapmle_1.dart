// import 'dart:convert';
// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'model_1.dart';
// class Example1 extends StatefulWidget {
//   const Example1({super.key});
//
//   @override
//   State<Example1> createState() => _Example1State();
// }
//
// class _Example1State extends State<Example1> {
//  List<Datum> UserList=[];
//
//   @override
//   void initState() {
//     GetUser();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: FutureBuilder(
//         future: GetUser(),
//         builder:  (context,snapshot) {
//         if(snapshot.hasData){
//           return ListView.builder(
//             itemCount: UserList.length,
//             itemBuilder:(context, index) {
//               return Column(
//                 children: [
//                   Text('UIserId:${UserList[index].firstName} ',style: TextStyle(color: Colors.red),)
//                 ],
//               );
//             },
//           );
//         }else{
//           return Center(child: CircularProgressIndicator());
//         }
//
//         },
//
//       ),
//     );
//
//   }
//  Future<List<Datum>> GetUser() async {
//
//    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
//    try {
//      if (response.statusCode == 200) {
//        var data = getResponseFromJson(response.body);
//        UserList.addAll(data.data);
//        return UserList;
//      } else {
//        print("Error");
//        throw Exception("HTTP request failed with status code ${response.statusCode}");
//      }
//    } catch (e) {
//      print("Exception: $e");
//      throw e; // Rethrow the caught exception
//    }
//  }
//
// }
//
