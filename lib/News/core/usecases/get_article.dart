

import 'package:dopeapp/News/core/resources/data_state.dart';
import 'package:dopeapp/News/core/usecases/usecase.dart';
import 'package:dopeapp/News/features/auth/domain/repository/article_repository.dart';
import 'package:dopeapp/News/features/auth/domain/usecases/entities/article.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({  Params, params}) {
    return _articleRepository.getNewsArticles();
  }
}
