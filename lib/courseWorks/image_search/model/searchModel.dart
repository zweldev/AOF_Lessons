import 'package:aof_lessons/courseWorks/image_search/view/home.dart';

class SearchModel {
  dogResult searchResult;
  List suggestion;

  SearchModel(
    this.searchResult, {
    this.suggestion = const [],
  });
}
