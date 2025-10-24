import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'blocs/book_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => BookBloc(),
      child: const BookClubApp(),
    ),
  );
}
