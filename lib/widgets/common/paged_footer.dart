import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PagedFooter extends StatelessWidget {
  final LoadStatus? mode;
  const PagedFooter({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    if (mode == LoadStatus.loading) {
      return const CupertinoActivityIndicator();
    }

    return Container();
  }
}
