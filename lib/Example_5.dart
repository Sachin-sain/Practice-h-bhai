// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// class Example5 extends StatefulWidget {
//   const Example5({super.key});
//   @override
//   State<Example5> createState() => _Example5State();
// }
// class _Example5State extends State<Example5> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     fetchData();
//   }
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   Future<void> fetchData() async {
//     final dio = Dio();
//     final apiUrl = 'https://jsonplaceholder.typicode.com/posts';
//     try {
//       final response = await dio.get(apiUrl);
//       print(response);
//       var data = jsonDecode(response.toString());
//       if (response.statusCode == 200) {
//         print(response.data);
//
//       } else {
//         print('Request failed with status ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }
//
// }
//
//
//
//
