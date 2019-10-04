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

class ProductionCompanyModel {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompanyModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    logoPath = parsedJson['logo_path'];
    originCountry = parsedJson['origin_country'];
  }

  static List<ProductionCompanyModel> fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return ProductionCompanyModel.fromJson(item);
    })?.toList();
  }
}
