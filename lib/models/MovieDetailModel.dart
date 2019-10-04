/*
 * Copyright 2019 ToolBone. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'BaseModel.dart';
import 'CollectionModel.dart';
import 'GenreModel.dart';
import 'ProductionCompanyModel.dart';
import 'ProductionCountryModel.dart';
import 'SpokenLanguage.dart';

class MovieDetailModel extends BaseModel {
  bool adult;
  String backdropPath;
  CollectionModel belongsToCollection;
  int budget;
  List<GenreModel> genres = [];
  String homepage;
  int id;
  String imdbID;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompanyModel> productionCompanies = [];
  List<ProductionCountryModel> productionCountries = [];
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages = [];
  String status;
  String tagLine;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailModel.fromJson(Map<String, dynamic> parsedJson) {
    adult = parsedJson['adult'];
    backdropPath = parsedJson['backdrop_path'];
    belongsToCollection =
        CollectionModel.fromJson(parsedJson['belongs_to_collection']);
    budget = parsedJson['budget'];
    genres = GenreModel.fromJsonArray(parsedJson["genres"]);
    homepage = parsedJson['homepage'];
    id = parsedJson['id'];
    imdbID = parsedJson['imdb_id'];
    originalLanguage = parsedJson['original_language'];
    originalTitle = parsedJson['original_title'];
    overview = parsedJson['overview'];
    popularity = parsedJson['popularity'];
    posterPath = parsedJson['poster_path'];
    productionCompanies = ProductionCompanyModel.fromJsonArray(
        parsedJson['production_companies']);
    productionCountries = ProductionCountryModel.fromJsonArray(
        parsedJson['production_countries']);
    releaseDate = parsedJson['release_date'];
    revenue = parsedJson['revenue'];
    runtime = parsedJson['runtime'];
    spokenLanguages =
        SpokenLanguage.fromJsonArray(parsedJson['spoken_languages']);
    status = parsedJson['status'];
    tagLine = parsedJson['tagline'];
    title = parsedJson['title'];
    video = parsedJson['video'];
    voteAverage = parsedJson['vote_average'];
    voteCount = parsedJson['vote_count'];
  }
}
