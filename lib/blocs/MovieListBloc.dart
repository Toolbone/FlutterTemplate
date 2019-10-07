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

import 'package:flutter_template/models/ItemModel.dart';
import 'package:rxdart/rxdart.dart';
import 'BaseBloc.dart';


class MovieListBloc extends BaseBloc<ItemModel> {
  Observable<ItemModel> get movieList => fetcher.stream;

  fetchMovieList(String type) async {
    ItemModel itemModel = await repository.fetchMovieList(type);
    fetcher.sink.add(itemModel);
  }

  @override
  dispose() {
    // TODO: implement dispose
    //this.dispose();
    return super.dispose();
  }

}