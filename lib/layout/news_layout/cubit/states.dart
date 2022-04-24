abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState(this.error);

}

class NewsGetSportLoadingState extends NewsStates{}

class NewsGetSportSuccessState extends NewsStates{}

class NewsGetSportErrorState extends NewsStates{
  final String error;

  NewsGetSportErrorState(this.error);

}

class NewsGetSciencesLoadingState extends NewsStates{}

class NewsGetSciencesSuccessState extends NewsStates{}

class NewsGetSciencesErrorState extends NewsStates{
  final String error;

  NewsGetSciencesErrorState(this.error);

}

class NewsGetSearchLoadingState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error;

  NewsGetSearchErrorState(this.error);

}




class NewsAppChangeModeState extends NewsStates{

}

class NewsAppChangeIconModeState extends NewsStates{

}

class NewsAppChangeDirectionState extends NewsStates{

}
class NewsAppChangeIconDirectionState extends NewsStates{

}
class NewsAppChangeColorIconState extends NewsStates{

}
class NewsAppChangeLanguageOfSearch extends NewsStates{}


class NewsAppChangeLanguageOfTitles extends NewsStates{}


class NewsGetTechnologyLoadingState extends NewsStates{}

class NewsGetTechnologySuccessState extends NewsStates{}

class NewsGetTechnologyErrorState extends NewsStates{
  final String error;

  NewsGetTechnologyErrorState(this.error);

}