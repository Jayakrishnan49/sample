import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample/model/data_base.dart';

class DataBaseCrud {

  Future<void> addData(DataBase value) async {
    
    final studentDB = await Hive.box<DataBase>('dataBox');

    final _id = await studentDB.add(value);
    value.id = _id;
  }

  Future<void>delete(int id)async{
    final studentDB = await Hive.box<DataBase>('dataBox');

    await studentDB.deleteAt(id);
  }

}
