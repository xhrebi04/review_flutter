import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_flutter/data/repositories/movie/movie_repository.dart';
import 'package:review_flutter/logic/cubits/movie_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Movies')),
        body: BlocProvider(
            create: (_) => MovieCubit(
                  RepositoryProvider.of<MovieRepository>(context),
                )..fetchMovies(),
            child:
                BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
              if (state is MovieFetchInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieFetchSuccess) {
                return ListView.separated(
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(state.movies[index].movie),
                        ),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 8),
                    itemCount: state.movies.length);
              } else if (state is MovieFetchFailure) {
                return Text(state.errorMsg.toString());
              } else {
                return Container();
              }
            })));
  }
}
