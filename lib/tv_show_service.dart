import 'dart:convert';

import 'package:app3_series_api/tv_show_model.dart';
import 'package:http/http.dart' as http;

class TvShowService {
  Future<List<TvShow>> fetchTvShows(String query) async {
    final response = await http.get(
      Uri.parse('https://api.tvmaze.com/search/shows?q=$query'), //conexão com api
    );

    if (response.statusCode == 200) { //200 resposta Ok
      final List<TvShow> tvShows = [];
      json.decode(response.body).forEach((item) { //forEach percorre o body item a item
        tvShows.add(TvShow.fromJson(item['show']));
      });
      return tvShows;
    } else {
      throw Exception('Falha ao carregar séries!');
    }
  }
}
