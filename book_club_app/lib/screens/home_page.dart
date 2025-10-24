import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book_bloc.dart';
import '../models/book.dart';
import 'detail_page.dart';

/// The main home page for the Book Club app.
/// Displays a list of books and allows sorting by author or title.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom header bar (pink rectangle, centered title, menu + profile icons)
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: SafeArea(
          bottom: false,
          child: Container(
            height: 64,
            width: double.infinity,
            color: const Color.fromARGB(255, 254, 238, 249),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: Menu icon
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    // Handle drawer or navigation here if needed
                  },
                ),

                // Center: Title
                const Text(
                  'Book Club Home',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

                // Right: Profile icon
                const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ),

      // Main content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row: "Sort by" label and filter chips in the same line
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sort by',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: _buildSortButtons(context)),
              ],
            ),
            const SizedBox(height: 16),

            // Section title
            const Text(
              'Books',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Book list (handled via BLoC)
            Expanded(
              child: BlocBuilder<BookBloc, BookState>(
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BookListLoaded) {
                    return _buildBookList(context, state.books);
                  } else {
                    return const Center(child: Text('No books available.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the sorting chips for Author / Title.
  Widget _buildSortButtons(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is! BookListLoaded) return const SizedBox.shrink();

        final isAuthorSelected = state.sortType == SortType.author;
        final isTitleSelected = state.sortType == SortType.title;

        return Row(
          children: [
            ChoiceChip(
              label: const Text('Author'),
              selected: isAuthorSelected,
              onSelected: (_) => context.read<BookBloc>().add(SortByAuthor()),
            ),
            const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Title'),
              selected: isTitleSelected,
              onSelected: (_) => context.read<BookBloc>().add(SortByTitle()),
            ),
          ],
        );
      },
    );
  }

  /// Builds the horizontal list of books.
  Widget _buildBookList(BuildContext context, List<Book> books) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailPage(book: book)),
            );
          },
          child: SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      book.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  book.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.author,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
