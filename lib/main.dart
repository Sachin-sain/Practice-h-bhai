
import 'dart:io';
import 'dart:io';
import 'dart:io';
import 'dart:async';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Curd App",
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper;

  late Future<List<NotesModel>> notesList;

  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes Sql"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: notesList,
                  builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        // reverse: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            //Data Delete
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                                child: Icon(Icons.delete_forever),
                              ),
                              onDismissed: (DismissDirection direction) {
                                setState(() {});
                              },
                              key: ValueKey<int>(snapshot.data![index].id!),
                              child: Card(
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                      snapshot.data![index].title.toString()),
                                  subtitle: Text(snapshot
                                      .data![index].description
                                      .toString()),
                                  trailing: Text(
                                      snapshot.data![index].age.toString()),
                                ),
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                      // reverse: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          //Data Delete
                          return InkWell(
                            //for data update
                            onTap: () {
                              dbHelper!.update(NotesModel(
                                  id: snapshot.data![index].id!,
                                  title: 'sjnjc',
                                  age: 12,
                                  description: 'sndjnkjwd',
                                  email: '123@ygy'));
                              setState(() {
                                notesList = dbHelper!.getNotesList();
                              });
                            },
                            child: Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                                child: Icon(Icons.delete_forever),
                              ),
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  dbHelper!.delete(snapshot.data![index].id!);
                                  notesList = dbHelper!.getNotesList();
                                  snapshot.data!.remove(snapshot.data![index]);
                                });
                              },
                              key: ValueKey<int>(snapshot.data![index].id!),
                              child: Card(
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                      snapshot.data![index].title.toString()),
                                  subtitle: Text(snapshot
                                      .data![index].description
                                      .toString()),
                                  trailing: Text(
                                      snapshot.data![index].age.toString()),
                                ),
                              ),
                            ),
                          );
                        });
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!
              .insert(NotesModel(
            title: 'Second  Note',
            age: 22,
            description: 'This is my first app',
            email: 'sainisachin7413@gmail.com',
          ))
              .then((value) {
            print("Data Added");
            //Data add
            setState(() {
              notesList = dbHelper!.getNotesList();
            });
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

class NotesModel {
  final int? id;
  final String title;
  final int age;
  final String description;
  final String email;

  NotesModel(
      {this.id,
        required this.title,
        required this.age,
        required this.description,
        required this.email});
  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        age = res['age'],
        description = res['description'],
        email = res['email'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'age': age,
      'description': description,
      'email': email,
    };
  }
}



class DBHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    String path =  add(documentDirectory.path, 'notes.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, age INTEGER, description TEXT NOT NULL, email TEXT NOT NULL)",
    );
  }

  Future<NotesModel> insert(NotesModel notesModel) async {
    var dbClient = await db;
    await dbClient!.insert('notes', notesModel.toMap());
    return notesModel;
  }

  Future<List<NotesModel>> getNotesList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
    await dbClient!.query('notes');
    return queryResult.map((e) => NotesModel.fromMap(e)).toList();
  }

//for particular delete
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('notes', where: 'id=?', whereArgs: [id]);
  }

//for data update
  Future<int> update(NotesModel) async {
    var dbClient = await db;
    return await dbClient!.update('notes',
        NotesModel.toMap(), //here is the confuse NotesModel=>notesModel
        where: 'id=?',
        whereArgs: [
          NotesModel.id
        ]); //here is the confuse NotesModel=>notesModel
  }
}