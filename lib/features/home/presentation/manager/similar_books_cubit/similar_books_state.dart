part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookHomeModel> similarBooksData;

  const SimilarBooksSuccess(this.similarBooksData);
}

final class SimilarBooksFailure extends SimilarBooksState {
  final String similarErrMsg;

  const SimilarBooksFailure(this.similarErrMsg);
}
