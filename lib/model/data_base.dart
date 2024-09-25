import 'package:hive/hive.dart';

part 'data_base.g.dart';

@HiveType(typeId: 0)

class DataBase extends HiveObject {

  @HiveField(0)
  int ?id;

  @HiveField(1)
  String userName;

  @HiveField(2)
  String passWord;

  DataBase({this.id,required this.userName,required this.passWord});
}