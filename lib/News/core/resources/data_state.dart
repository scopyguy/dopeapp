

import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException error;
  const DataState({this.data, required this.error});
}

class DataSuccess<T> extends DataState<T> {
   DataSuccess(T data) : super(data: data, error: DioException(requestOptions: someOptions));
   
     static get someOptions => true; // Provide a default DioException or handle it accordingly
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
