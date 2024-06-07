 import 'package:equatable/equatable.dart';
class Movie extends Equatable{
   final int id;
   final String title;
   final String  poster_path;
   // final String backdropPath;
   final List<int> genreIds;
   final String overview;
   final double voteAverage;
   final String releaseDate;
   final int runtime;


   const Movie( {
    required this.id,
    required this.title,
     required this.poster_path,
    // required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
     required this.runtime,
  });

   @override
   List<Object> get props => [
     id,
     title,
     // backdropPath,
     poster_path,
     genreIds,
     overview,
     voteAverage,
     releaseDate,
     runtime
   ];


}