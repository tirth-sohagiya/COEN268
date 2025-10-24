import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../blocs/book_bloc.dart';

/// Displays the details for a selected book, including cover, title,
/// author, and a long scrollable description.
class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Pink header bar with centered title and profile icon
          SafeArea(
            bottom: false,
            child: Container(
              height: 64,
              width: double.infinity,
              color: const Color.fromARGB(255, 254, 238, 249),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back arrow on the left
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      context.read<BookBloc>().add(ShowBookList());
                      Navigator.pop(context);
                    },
                  ),

                  // Centered title
                  const Text(
                    'Book Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),

                  // Profile icon on the right
                  const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),

          // Main scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Book image (larger, left-aligned, slightly transparent)
                  Opacity(
                    opacity: 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        book.imageUrl,
                        height: 320, // slightly larger
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title (left aligned)
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Author (left aligned)
                  Text(
                    book.author,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Description (left aligned, cleaner spacing)
                  Text(
                    book.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
