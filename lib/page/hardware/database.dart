import 'dart:io';

import 'package:amazing_flutter/entity/database_demo/diy_project.dart';
import 'package:sqflite/sqflite.dart'; //数据库
import 'dart:async'; //异步操作
import 'package:path/path.dart'; //本地路径访问
import 'package:path_provider/path_provider.dart'; //本地路径访问

class DataBase {
  Database _myDateBase;

  //定义表名
  final String tableName = "testTable";

  //定义各个字段名
  final String columnId = "id";
  final String columnName = "name";

  //获取数据库
  Future get db async {
    if (_myDateBase != null) {
      print('数据库已存在');
      return _myDateBase;
    } else
      _myDateBase = await initDb();
    return _myDateBase;
  }

  //初始化数据库，根据路径版本号新建数据库
  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "diyDB.db");
    var dataBase = await openDatabase(path, version: 1, onCreate: _onCreate);
    print('数据库创建成功，version： 1');
    return dataBase;
  }

  //新建数据库表
  FutureOr _onCreate(Database db, int version) async {
    await db.execute('''create table $tableName(
    $columnId integer primary key autoincrement,
    $columnName text not null)''');
    print('Table is created');
  }

  //插入diyProject
  Future<int> insertDiyProject(DiyProject diy) async {
    //获取数据库实例
    Database database = await db;
    //diy.toMap()是将diy实例转换成字段名和值对应的map
    var result = database.insert(tableName, diy.toMap());
    print('数据已插入');
    return result;
  }

  //获取所有diyProject
  Future<List> getDiyProjects() async {
    //获取数据库实例
    Database database = await db;
    //返回一个 map型的数组，其中map是由字段名和值构成
    var result = await database
        .rawQuery("select * from $tableName order by $columnId desc");
    print('获取所有diyProject,当前diyProject有: $result');
    return result;
  }

  //获取diyProject总数
  Future<int> getDiyCount() async {
    Database database = await db;
    var result = await database.rawQuery("select count(*) from $tableName");
    /*查询结果返回的是一个map类型的数组，虽然这里查询结果只有一条，但是很多查询是会返回多条数据的，所以是一个数组类型。
     这里我们取数组的第一个值，然后再通过键来取对应的数据
    */
    return result[0]['count(*)'];
  }

  //获取单个diyProject
  Future<DiyProject> getDiyProject(int id) async {
    Database database = await db;
    //根据id查询对应的diy项目，并返回一个map类型的数组
    var result = await database
        .rawQuery("select * from $tableName where $columnId = $id");
    if (result.length == 0) {
      return null;
    } else
      return DiyProject.fromMap(result[0]);
  }

  //更新diyProject
  Future<int> updateDiyProject(DiyProject diyProject) async {
    Database database = await db;
    var result = database.update(tableName, diyProject.toMap(),
        where: "$columnId = ?", whereArgs: [diyProject.id]);
    print('我是更新数据的方法 本次更新的res: $result');
    return result;
  }

  //删除diyProject
  Future<int> deleteDiyProject(int id) async {
    Database database = await db;
    var result = await database
        .rawDelete("delete from $tableName where $columnId = $id");
    return result;
  }

  //关闭数据库
  Future close() async {
    Database database = await db;
    database.close();
  }
}
