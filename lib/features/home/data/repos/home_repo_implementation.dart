import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_home_model/book_home_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookHomeModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.getData(
          url: 'volumes?q=subject:kids&sorting=newest');
      List<BookHomeModel> booksList = [];
      for (var item in data['item']) {
        booksList.add(
          BookHomeModel.fromJson(item),
        );
      }
      return right(booksList);
    } catch (e) {
      return left(
        ServerFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookHomeModel>>> fetchTheFeaturedBooks() {
    throw UnimplementedError();
  }
}
