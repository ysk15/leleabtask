import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:leleabtask/emplist/model/empresmodel.dart';
import 'package:leleabtask/emplist/provider/emplistprovider.dart';
import 'package:leleabtask/emplist/view/emplistpage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(EmpResModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lelab task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<EmpListProvider>(create: (context)=>EmpListProvider(),builder:(_,__)=>EmpListPage() ,),
    );
  }
}


