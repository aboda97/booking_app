import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_home_model/book_home_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookHomeModel>>> fetchTheFeaturedBooks();
  Future<Either<Failure,List<BookHomeModel>>> fetchNewestBooks();
}
