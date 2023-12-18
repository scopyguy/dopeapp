import 'dart:async';

import 'package:dopeapp/News/features/auth/data/models/article.dart';

import 'article_dao.dart';


import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;




part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModels])
abstract class AppDataBase extends FloorDatabase {
  ArticleDao get articleDao;
}
