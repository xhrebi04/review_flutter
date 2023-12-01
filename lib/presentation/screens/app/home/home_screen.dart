import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_flutter/enums/enums.dart';
import 'package:review_flutter/generated/l10n.dart';
import 'package:review_flutter/logic/cubit/home_cubit.dart';
import 'package:review_flutter/presentation/screens/app/home/widgets/movie_item.dart';
import 'package:review_flutter/presentation/widgets/error_view.dart';
import 'package:review_flutter/presentation/widgets/loading_view.dart';
import 'package:review_flutter/presentation/widgets/navigation/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: S.of(context).movies),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          switch (state.status) {
            case FetchStatus.fetching:
              return const LoadingView();
            case FetchStatus.success:
              return ListView.separated(
                  itemBuilder: (context, index) =>
                      MovieItem(movie: state.movies[index]),
                  separatorBuilder: (context, index) =>
                      const Divider(height: 8),
                  itemCount: state.movies.length);
            case FetchStatus.failure:
              return ErrorView(message: state.errorMessage);
            case FetchStatus.none:
              return Container();
          }
        }));
  }
}
