import 'package:dopeapp/News/features/auth/domain/usecases/entities/article.dart';
import 'package:equatable/equatable.dart';
abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? articles;
  const LocalArticleEvent({this.articles});

  @override
  List<Object> get props => [articles!];
}

class GetSavedArticle extends LocalArticleEvent {
  const GetSavedArticle();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity artticle) : super(articles: artticle);
}

class SavedArticle extends LocalArticleEvent {
  const SavedArticle(ArticleEntity article) : super(articles: article);
}
