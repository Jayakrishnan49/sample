import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample/functions/functions.dart';
import 'package:sample/model/data_base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataBaseCrud dataBaseCrud = DataBaseCrud();

  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: userName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    TextFormField(
                      controller: passWord,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      onPressed: () {

                        dataBaseCrud.addData(DataBase(
                            userName: userName.text, passWord: passWord.text));

                      },
                      child: Text('submit'),
                    ),
                    
                  ],
                ),
                DataList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataList extends StatelessWidget {
  const DataList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DataBaseCrud dataBaseCrud =DataBaseCrud();
    return Expanded(
        child: ValueListenableBuilder(
            valueListenable: Hive.box<DataBase>('dataBox').listenable(),
            builder:(context, box, child) {
              var data=box.values.toList().cast<DataBase>();
              return ListView.builder(
                itemBuilder: (context, index) {
                var todo = data[index];
                return ListTile(
                  leading: Text(todo.id.toString()),
                  title: Text(todo.userName),
                  subtitle: Text(todo.passWord),
                  trailing: IconButton(
                    onPressed: (){
                      dataBaseCrud.delete(index);
                    }, 
                    icon: Icon(Icons.delete)),
                );
              },
              itemCount: data.length,
              );
            },));
  }
}


