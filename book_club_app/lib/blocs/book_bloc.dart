import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/book.dart';

/// Enum representing the current sort mode.
enum SortType { author, title }

/// ---------------------------------------------------------------------------
/// EVENTS
/// ---------------------------------------------------------------------------

/// Base class for all book-related events.
abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when the list should be sorted by author.
class SortByAuthor extends BookEvent {}

/// Event triggered when the list should be sorted by title.
class SortByTitle extends BookEvent {}

/// Event triggered when the user navigates back to the book list view.
class ShowBookList extends BookEvent {}

/// ---------------------------------------------------------------------------
/// STATES
/// ---------------------------------------------------------------------------

/// Base class for all states of the BookBloc.
abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

/// State indicating that the application is loading data.
class BookLoading extends BookState {}

/// State representing a loaded list of books.
class BookListLoaded extends BookState {
  final List<Book> books;
  final SortType sortType;

  const BookListLoaded({
    required this.books,
    required this.sortType,
  });

  @override
  List<Object?> get props => [books, sortType];
}

/// ---------------------------------------------------------------------------
/// BLOC IMPLEMENTATION
/// ---------------------------------------------------------------------------

/// Bloc that manages the loading, sorting, and presentation of books.
class BookBloc extends Bloc<BookEvent, BookState> {
  /// Internal list of books.
  List<Book> _bookList = [];

  BookBloc() : super(BookLoading()) {
    on<SortByAuthor>(_onSortByAuthor);
    on<SortByTitle>(_onSortByTitle);
    on<ShowBookList>(_onShowBookList);

    _initializeBooks();
  }

  /// Initializes the book list asynchronously.
  Future<void> _initializeBooks() async {
    emit(BookLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    _bookList = sampleBooks;
    emit(BookListLoaded(books: _bookList, sortType: SortType.author));
  }

  /// Handles the [SortByAuthor] event.
  Future<void> _onSortByAuthor(
    SortByAuthor event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    await Future.delayed(const Duration(milliseconds: 300));
    final sorted = List<Book>.from(_bookList)
      ..sort((a, b) => a.author.compareTo(b.author));
    emit(BookListLoaded(books: sorted, sortType: SortType.author));
  }

  /// Handles the [SortByTitle] event.
  Future<void> _onSortByTitle(
    SortByTitle event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    await Future.delayed(const Duration(milliseconds: 300));
    final sorted = List<Book>.from(_bookList)
      ..sort((a, b) => a.title.compareTo(b.title));
    emit(BookListLoaded(books: sorted, sortType: SortType.title));
  }

  /// Handles the [ShowBookList] event.
  void _onShowBookList(
    ShowBookList event,
    Emitter<BookState> emit,
  ) {
    emit(BookListLoaded(books: _bookList, sortType: SortType.author));
  }
}
