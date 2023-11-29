part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookHomeModel> newestBooksData;

  const NewestBooksSuccess(this.newestBooksData);
}

final class NewestBooksFailure extends NewestBooksState {
  final String newestErrMsg;

  const NewestBooksFailure(this.newestErrMsg);
}
