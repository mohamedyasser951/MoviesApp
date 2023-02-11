abstract class MovieStates {}
class Initstate extends MovieStates{}

//Now Playing
class NowPlayingSuccessState extends MovieStates{}
class NowPlayingErrorState extends MovieStates{}
class NowPlayingLoadingState extends MovieStates{}

//Trending people
class GetTrendingPeopleSuccessState extends MovieStates{}
class GetTrendingPeopleErrorState extends MovieStates{}
class GetTrendingPeopleLoadingState extends MovieStates{}



//Get TopRate
class GetTopRateSuccessState extends MovieStates{}
class GetTopRateErrorState extends MovieStates{}
class GetTopRateLoadingState extends MovieStates{}


//Get Genere
class GetGenereSuccessState extends MovieStates{}
class GetGenereErrorState extends MovieStates{}
class GetGenereLoadingState extends MovieStates{}


//Get Movie by GenereId
class GetMovieByGenereIdSuccessState extends MovieStates{}
class GetMovieByGenereIdErrorState extends MovieStates{}
class GetMovieByGenereIdLoadingState extends MovieStates{}
