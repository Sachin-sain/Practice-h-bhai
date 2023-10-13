// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// class Example3 extends StatefulWidget {
//   const Example3({super.key});
//
//   @override
//   State<Example3> createState() => _Example3State();
// }
//
// class _Example3State extends State<Example3> {
//   bool terms=true;
//   TextEditingController emailController=TextEditingController();
//   TextEditingController passwordController=TextEditingController();
//   TextEditingController firstNameController=TextEditingController();
//   TextEditingController lastNameController=TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     SignUp();
//
//   }
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 40,
//           child: TextFormField(
//             controller: firstNameController,
//             decoration: InputDecoration(
//               hintText: 'firstname'
//             ),
//           ),
//         ),
//         SizedBox(height: 20,),
//         SizedBox(
//           height: 40,
//           child: TextFormField(
//             controller: lastNameController,
//             decoration: InputDecoration(
//                 hintText: 'lastname'
//             ),
//           ),
//         ),
//         SizedBox(height: 20,),
//         SizedBox(
//           height: 40,
//           child: TextFormField(
//             controller: emailController,
//             decoration: InputDecoration(
//                 hintText: 'email'
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 40,
//           child: TextFormField(
//             controller: passwordController,
//             decoration: InputDecoration(
//                 hintText: 'password'
//             ),
//           ),
//         ),
//         SizedBox(height: 20,),
//         GestureDetector(
//           onTap: (){
//             SignUp();
//           },
//           child: Text('Register'),
//         )
//       ],
//     );
//   }
//   Future<void> SignUp( )async{
//     var response=await http.post(Uri.parse('https://uatnew.tutorslms.com/api/users/signup'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Accept'     :'application/json',
//         },
//         body:jsonEncode({
//           'first_name':firstNameController.text,
//           'last_name':lastNameController.text,
//         'email':emailController.text,
//         'password':passwordController.text,
//         'terms':terms,
//       })
//     );
//     try{
//       if(response.statusCode==200){
//         print(response.statusCode);
//         var data=jsonDecode(response.body.toString());
//         print(response.body);
//         print(data);
//       }else{
//         print("Something went wrong");
//       }
//     }catch (e){
//       print("Exception $e");
//     }throw Exception();
//   }
// }
//
