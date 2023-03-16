import 'package:flutter/material.dart';
import 'package:movieapp/data/models/movie_model.dart';

@immutable
class SearchStates {}

class IntialSearchState extends SearchStates {}

class EmptySearchState extends SearchStates {}

class LoadingSearchState extends SearchStates {}

class SuccessSearchState extends SearchStates {
  final MainModel model;
  SuccessSearchState({required this.model});
}

class ErorrSearchState extends SearchStates {}
