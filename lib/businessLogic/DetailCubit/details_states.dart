import 'package:flutter/material.dart';

@immutable
class DetailStates{}

class IntialDetailState extends DetailStates{}

//Get MoviebyId
class GetMovieByIdSuccessState extends DetailStates {}

class GetMovieByIdErrorState extends DetailStates {}

class GetMovieByIdLoadingState extends DetailStates {}
