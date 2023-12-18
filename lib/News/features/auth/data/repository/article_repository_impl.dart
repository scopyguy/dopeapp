


import 'package:dio/dio.dart';
import 'package:dopeapp/News/DAO/app_database.dart';
import 'package:dopeapp/News/core/constant/constant.dart';
import 'package:dopeapp/News/core/resources/data_state.dart';
import 'package:dopeapp/News/features/auth/data/data_sources/remote/newsapi_service.dart';
import 'package:dopeapp/News/features/auth/data/models/article.dart';
import 'package:dopeapp/News/features/auth/domain/repository/article_repository.dart';
import 'package:dopeapp/News/features/auth/domain/usecases/entities/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDataBase _appDataBase;
  ArticleRepositoryImpl(this._newsApiService, this._appDataBase);

  @override
  Future<DataState<List<ArticleModels>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        islam: islamQuery,
        category: categoryQuery,
      );

      print(httpResponse);
      return  DataSuccess([]);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModels>> getSavedArticles() async {
    return _appDataBase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .deleteArticle(ArticleModels.fromEntity(article));
  }

  @override
  Future<void> savedArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .insertArticle(ArticleModels.fromEntity(article));
  }
  
}
