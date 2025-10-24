import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';

/// Defines how the books can be sorted.
enum SortType { author, title }

/// Book-related events.
abstract class BookEvent {}

class LoadBooks extends BookEvent {}

class SortByAuthor extends BookEvent {}

class SortByTitle extends BookEvent {}

class ShowBookList extends BookEvent {}

/// States representing different stages of book data.
abstract class BookState {}

class BookLoading extends BookState {}

class BookListLoaded extends BookState {
  final List<Book> books;
  final SortType sortType;

  BookListLoaded({
    required this.books,
    required this.sortType,
  });
}

/// The main Bloc handling book data and sorting logic.
class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookLoading()) {
    on<LoadBooks>(_onLoadBooks);
    on<SortByAuthor>(_onSortByAuthor);
    on<SortByTitle>(_onSortByTitle);
    on<ShowBookList>(_onShowBookList);

    // Load books automatically after Bloc initialization
    Future.microtask(() => add(LoadBooks()));
  }

  /// Loads all books and sorts them by author by default.
  void _onLoadBooks(LoadBooks event, Emitter<BookState> emit) {
    final sortedBooks = List<Book>.from(sampleBooks)
      ..sort((a, b) => a.author.compareTo(b.author));

    emit(BookListLoaded(books: sortedBooks, sortType: SortType.author));
  }

  /// Sorts books by author.
  void _onSortByAuthor(SortByAuthor event, Emitter<BookState> emit) {
    if (state is BookListLoaded) {
      final current = (state as BookListLoaded).books;
      final sorted = List<Book>.from(current)
        ..sort((a, b) => a.author.compareTo(b.author));
      emit(BookListLoaded(books: sorted, sortType: SortType.author));
    }
  }

  /// Sorts books by title.
  void _onSortByTitle(SortByTitle event, Emitter<BookState> emit) {
    if (state is BookListLoaded) {
      final current = (state as BookListLoaded).books;
      final sorted = List<Book>.from(current)
        ..sort((a, b) => a.title.compareTo(b.title));
      emit(BookListLoaded(books: sorted, sortType: SortType.title));
    }
  }

  /// Returns to the book list view when navigating back from details.
  void _onShowBookList(ShowBookList event, Emitter<BookState> emit) {
    if (state is! BookListLoaded) {
      add(LoadBooks());
    }
  }
}
