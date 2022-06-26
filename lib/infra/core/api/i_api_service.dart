import 'package:delivery_hero_flutter_study_case/infra/core/api/api_endpoints.dart';
import 'package:delivery_hero_flutter_study_case/infra/movie_details/dto/movie_details_dto.dart';
import 'package:delivery_hero_flutter_study_case/infra/search/dto/search_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'i_api_service.g.dart';

@RestApi()
abstract class IApiService {
  factory IApiService(Dio dio, {String? baseUrl}) = _IApiService;

  @GET(ApiEndpoints.MOVIE_DETAILS)
  Future<MovieDetailsDto> getMovieDetails(
    @Queries() Map<String, dynamic> query,
    @Path('movie_id') String movieId,
  );

  @GET(ApiEndpoints.SEARCH)
  Future<SearchDto> search(@Queries() Map<String, dynamic> query);
}
