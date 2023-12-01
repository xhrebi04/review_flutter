import 'package:flutter/material.dart';
import 'package:review_flutter/data/models/movie_model.dart';
import 'package:review_flutter/enums/enums.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/logic/cubit/movie_detail_cubit.dart';
import 'package:review_flutter/presentation/widgets/error_view.dart';
import 'package:review_flutter/presentation/widgets/loading_view.dart';
import 'package:review_flutter/presentation/widgets/navigation/my_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: S.of(context).detail),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
            builder: (context, state) {
          switch (state.status) {
            case FetchStatus.fetching:
              return const LoadingView();
            case FetchStatus.success:
              MovieModel? movie = state.movie;
              return movie != null
                  ? Center(child: Text(movie.movie))
                  : Container();
            case FetchStatus.failure:
              return ErrorView(message: state.errorMessage);
            case FetchStatus.none:
              return Container();
          }
        }));
  }
}
