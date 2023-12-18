
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dopeapp/News/core/resources/data_state.dart';
import 'package:dopeapp/News/features/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:dopeapp/News/features/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/usecases/get_article.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;
  RemoteArticlesBloc(
    this._getArticlesUseCase,
  ) : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticlesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      if (kDebugMode) {
        print(dataState.error.message);
      }
      emit((RemoteArticlesError(dataState.error, Error)));
    }
  }
}
