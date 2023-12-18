import 'package:floor/floor.dart';
import 'package:dopeapp/News/features/auth/data/models/article.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModels article);
  @delete
  Future<void> deleteArticle(ArticleModels articleModels);
  @Query('SELECT * FROM article')
  Future<List<ArticleModels>> getArticles();
}
