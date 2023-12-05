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
          url: 'volumes?Filtering=free-ebooks&Sorting=newest &q=language');
      List<BookHomeModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookHomeModel.fromJson(item));
        } catch (e) {
          books.add(BookHomeModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
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
      var data = await apiService.getData(
          url: 'volumes?Filtering=free-ebooks&q=subject:language');
      List<BookHomeModel> books = [];
      for (var item in data['items']) {
        books.add(BookHomeModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookHomeModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.getData(
          url:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:language');
      List<BookHomeModel> books = [];
      for (var item in data['items']) {
        books.add(BookHomeModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
