// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class Example2 extends StatefulWidget {
//   const Example2({Key? key}) : super(key: key);
//
//   @override
//   State<Example2> createState() => _Example2State();
// }
//
// class _Example2State extends State<Example2> {
//   String name = "morpheus"; // Provide default values here
//   String job = "leader";    // Provide default values here
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post Api'),
//       ),
//       body: FutureBuilder<String>(
//         future: fetchData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: 5, // You can change this as per your requirement
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('Item $index'),
//                   subtitle: Text(snapshot.data!), // Display API response data here
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No data available.'));
//           }
//         },
//       ),
//     );
//   }
//
//   Future<String> fetchData() async {
//     var url = 'https://reqres.in/api/users'; // Corrected URL
//     var response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json', // Fixed header
//       },
//       body: jsonEncode({'name': name, 'job': job}),
//     );
//
//     if (response.statusCode == 201) {
//       var data = jsonDecode(response.body);
//       print(response.body);
//       print(data);
//       return data.toString(); // You can return the data as a string or process it as needed.
//     } else {
//       throw Exception('Failed to post data');
//     }
//   }
// }
