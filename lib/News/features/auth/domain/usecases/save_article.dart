

import 'package:dopeapp/News/core/usecases/usecase.dart';
import 'package:dopeapp/News/features/auth/domain/repository/article_repository.dart';
import 'package:dopeapp/News/features/auth/domain/usecases/entities/article.dart';

class SavedArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  SavedArticleUseCase(this._articleRepository);

  @override
  Future<void> call({dynamic Params, params}) {
    return _articleRepository.savedArticle(params!);
  }
}
