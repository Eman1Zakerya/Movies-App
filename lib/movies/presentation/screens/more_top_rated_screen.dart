import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/services/services_locator.dart';
import '../components/see_more_component.dart';
import '../controller/movies_bloc.dart';

class MoreTopRatedScreen extends StatelessWidget {
  const MoreTopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<MoviesBloc>()
        ..add(GetTopRatedMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous,current)=> previous.topRatedState != current.topRatedState,
        builder: (context, state) {
          switch(state.topRatedState){

            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              return Scaffold(
                body: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.topRatedMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.topRatedMovies[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            /// TODO : NAVIGATE TO  MOVIE DETAILS
                          },
                          child:  ClipRRect(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            child: MovieItem(
                              rate: movie.voteAverage, year: movie.runtime,
                              description: movie.overview, image: ApiConstance.imageUrl(movie.poster_path!),
                              title: movie.title,),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            case RequestState.error:
              return Center(child: SizedBox(
                height: 400,
                child: Text(state.topRatedMessage),
              ));
          }
        },
      ),
    );
  }


}