import 'dart:developer';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_home_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookHomeModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(
          url: 'volumes?q=subject:kids&sorting=newest');
      List<BookHomeModel> booksList = [];
      for (var item in data['items']) {
        booksList.add(
          BookHomeModel.fromJson(item),
        );
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookHomeModel>>> fetchTheFeaturedBooks() async {
    try {
      var data = await apiService.getData(url: 'volumes?q=subject:kids');
      List<BookHomeModel> booksList = [];
      for (var item in data['items']) {
        booksList.add(
          BookHomeModel.fromJson(item),
        );
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      log(e.toString());
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
