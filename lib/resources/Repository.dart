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

import 'dart:async';

import 'package:flutter_template/models/ItemModel.dart';
import 'package:flutter_template/models/MovieDetailModel.dart';
import 'package:flutter_template/models/MovieImageModel.dart';
import 'package:flutter_template/models/MovieVideosModel.dart';

import 'MovieApiClient.dart';



class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieDetailModel> fetchMovieDetail(int movieId) =>
      moviesApiProvider.fetchMovieDetail(movieId);

  Future<MovieImageModel> fetchMovieImages(int movieId) =>
      moviesApiProvider.fetchMovieImages(movieId);

  Future<ItemModel> fetchMovieList(String type) =>
      moviesApiProvider.fetchMovieList(type);

  Future<MovieVideosModel> fetchVideoList(int movieId) =>
      moviesApiProvider.fetchVideoList(movieId);
}
