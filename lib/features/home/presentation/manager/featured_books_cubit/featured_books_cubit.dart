import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_home_model/book_home_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetechFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var results = await homeRepo.fetchTheFeaturedBooks();

    results.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(failure.errMsg),
        );
      },
      (books) {
        emit(
          FeaturedBooksSuccess(books),
        );
      },
    );
  }
}
