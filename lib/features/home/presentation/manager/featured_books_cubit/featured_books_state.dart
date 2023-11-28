part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookHomeModel> booksData;

  const FeaturedBooksSuccess(this.booksData);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMsg;

  const FeaturedBooksFailure(this.errMsg);
}
