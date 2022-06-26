import 'package:delivery_hero_flutter_study_case/infra/core/base/base_consumer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends BaseConsumerState<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
