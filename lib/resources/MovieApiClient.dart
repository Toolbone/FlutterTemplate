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
import 'dart:convert';

import 'package:flutter_template/models/ItemModel.dart';
import 'package:flutter_template/models/MovieDetailModel.dart';
import 'package:flutter_template/models/MovieImageModel.dart';
import 'package:flutter_template/models/MovieVideosModel.dart';
import 'package:http/http.dart' show Client;


class MovieApiProvider {
  Client client = Client();

  static const String apiKey = "2d9f2b9a7cb8f1aa7ac46888aca20a42";
  static const String baseUrl = "http://api.themoviedb.org/";

  Future<MovieVideosModel> fetchVideoList(int movieId) async {
    final response = await client.get(
        "${baseUrl}3/movie/$movieId/videos?api_key=$apiKey&language=en-US&page=1");
    print(response.request.url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieVideosModel.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<ItemModel> fetchMovieList(String type) async {
    final response = await client
        .get("${baseUrl}3/movie/$type?api_key=$apiKey&language=en-US&page=1");
    print(response.request.url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<MovieDetailModel> fetchMovieDetail(int movieId) async {
    final response = await client.get(
        "${baseUrl}3/movie/$movieId?api_key=$apiKey&language=en-US&page=1");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<MovieImageModel> fetchMovieImages(int movieId) async {
    final response = await client.get(
        "${baseUrl}3/movie/$movieId/images?api_key=$apiKey&language=en-US&page=1");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieImageModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
