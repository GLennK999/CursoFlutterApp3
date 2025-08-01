import 'package:app3_series_api/tv_show_grid.dart';
import 'package:app3_series_api/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavTvShowScreen extends StatefulWidget {
  const FavTvShowScreen({super.key});

  @override
  State<FavTvShowScreen> createState() => _FavTvShowScreenState();
}

class _FavTvShowScreenState extends State<FavTvShowScreen> {
  @override
  Widget build(BuildContext context) {
    var tvShows = context.watch<TvShowModel>().tvShows;
    final tvShowModel = context.watch<TvShowModel>();
    bool ratingDescending = false;
    bool nameDescending = false;

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    context.read<TvShowModel>().sortTvShowsByName(),
                child: context.read<TvShowModel>().nameDescending
                    ? Transform.flip(
                        flipX: true, // altera o eixo X para fazer o efeito de ZA
                        child: const Icon(Icons.sort_by_alpha, size: 20),
                      )
                    : const Icon(Icons.sort_by_alpha, size: 20),
              ),
              SizedBox(width: 16),
              FloatingActionButton(
                onPressed: () =>
                    context.read<TvShowModel>().sortTvShowsByRating(),
                child: context.read<TvShowModel>().ratingDescending
                    ? const Icon(Icons.stars_sharp, size: 20)
                    : const Icon(Icons.stars_outlined, size: 20),
              ),
            ],
          ),
          Text(
            tvShows.isEmpty ? 'Nenhuma Série Favorita' : 'Favoritas',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 16),
          Expanded(child: TvShowGrid(tvShows: tvShows)),
        ],
      ),
    );
  }
}
