import '../../model/home_model.dart';
import '../../service/config.dart';
import '../../service/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> reuqestMovieList(int start) async {
    final movieURL =
        "/movie/top250?start=$start&count=${HomeConfig.movieCount}";

    final result = await HttpRequest.request(movieURL);
    final subjects = result["subjects"];

    List<MovieItem> movies = [];
    for (var sub in subjects) {
      // movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}
