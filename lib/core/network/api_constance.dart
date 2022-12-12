class ApiConstance
{
  static const baseUrl='https://api.themoviedb.org/3';

  static const apiKey='ae8cdad0ee0b34488d858d7e920fe3ac';

  static const nowPlayingMoviesPath='$baseUrl/movie/now_playing?api_key=$apiKey';

  static const nowPopularMoviesPath='$baseUrl/movie/popular?api_key=$apiKey';

  static const nowTopRatedMoviesPath='$baseUrl/movie/top_rated?api_key=$apiKey';

  static  String movieDetailsPath(int idMovie)=>'$baseUrl/movie/$idMovie?api_key=$apiKey';

  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path)=> '$baseImageUrl$path';


}