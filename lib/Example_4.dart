// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter POST Request Example',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final apiUrl = "https://jsonplaceholder.typicode.com/posts";
//   TextEditingController titleController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter POST Request Example'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(hintText: "Title"),
//             ),
//             TextField(
//               controller: bodyController,
//               decoration: InputDecoration(hintText: "Body"),
//             ),
//             ElevatedButton(
//               onPressed: sendPostRequest,
//               child: Text("Create Post"),
//             ),
//           ],
//         ),
//       ),
//
//
//     );
//   }
//
//   Future<void> sendPostRequest() async {
//     var response = await http.post(Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "title": titleController.text,
//           "body": bodyController.text,
//           "userId": 1,
//         }));
//
//     if (response.statusCode == 201) {
//       print(response.statusCode);
//       print(response.body);
//     } else {
//
//     }
//   }
// }