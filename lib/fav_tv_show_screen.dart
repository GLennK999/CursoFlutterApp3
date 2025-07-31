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
                onPressed: () {
                  
                  
                  if(nameDescending) {
                    tvShowModel.sortTvShowsByName(nameDescending);
                    nameDescending = false;
                  }else{
                    tvShowModel.sortTvShowsByName(nameDescending);
                    nameDescending = true;
                  }
                  
                },
                child: const Icon(Icons.sort_by_alpha, size: 20),
              ),
              SizedBox(width: 16),
              FloatingActionButton(
                onPressed: () {
                  if (ratingDescending) {
                    tvShowModel.sortTvShowsByRating(ratingDescending);
                    ratingDescending = false;
                  } else {
                    tvShowModel.sortTvShowsByRating(ratingDescending);
                    ratingDescending = true;
                  }
                },
                child: const Icon(Icons.stars_outlined, size: 20),
              ),
              /*
              Transform.flip(
                  flipX: true, // Flips along the X-axis (horizontally)
                  child: const Icon(Icons.sort_by_alpha, size: 20),
                ),
                */
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
