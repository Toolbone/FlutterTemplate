
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

class MovieVideosModel extends BaseModel {

  final int id;
  final List<Results> results;

	MovieVideosModel.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		results = List<Results>.from(map["results"].map((it) => Results.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['results'] = results != null ? 
			this.results.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}


class Results {

	final String id;
	final String iso_639_1;
	final String iso_3166_1;
	final String key;
	final String name;
	final String site;
	final int size;
	final String type;

	Results.fromJsonMap(Map<String, dynamic> map):
				id = map["id"],
				iso_639_1 = map["iso_639_1"],
				iso_3166_1 = map["iso_3166_1"],
				key = map["key"],
				name = map["name"],
				site = map["site"],
				size = map["size"],
				type = map["type"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['iso_639_1'] = iso_639_1;
		data['iso_3166_1'] = iso_3166_1;
		data['key'] = key;
		data['name'] = name;
		data['site'] = site;
		data['size'] = size;
		data['type'] = type;
		return data;
	}
}
