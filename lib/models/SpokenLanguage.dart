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

class SpokenLanguage {
  String iso_639_1;
  String name;

  SpokenLanguage.fromJson(Map<String, dynamic> parsedJson) {
    iso_639_1 = parsedJson['iso_639_1'];
    name = parsedJson['name'];
  }

  static List<SpokenLanguage> fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return SpokenLanguage.fromJson(item);
    })?.toList();
  }
}
