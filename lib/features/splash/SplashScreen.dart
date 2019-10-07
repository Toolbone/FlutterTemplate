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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/blocs/MovieListBloc.dart';
import 'package:flutter_template/features/home/HomeScreen.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static bool isCompanyShown = true;
  static bool isFlutterShown = false;
  static String assetCompanyLogo = 'res/graphics/toolbone_logo-01.svg';
  static String assetFlutterLogo = 'res/graphics/flutter_logo-01.svg';
  final movieListBloc = MovieListBloc();
  final holdBlocList=[];

  static final Widget svgCompanyLogo = new SvgPicture.asset(
    assetCompanyLogo,
    semanticsLabel: 'Company Logo',
  );

  static final Widget svgFlutterLogo = new SvgPicture.asset(
    assetFlutterLogo,
    semanticsLabel: 'Flutter Logo',
  );

  @override
  void initState() {
    super.initState();

    loadSplashLogos();
    loadPreloadData();
  }

  void loadPreloadData() {
    movieListBloc.fetchMovieList("top_rated");
  }

  Future<Timer> loadSplashLogos() async {
    return new Timer(Duration(seconds: 5), hideSplashLogos);
  }

  Future<Timer> hideSplashLogos() async {
    setState(() {
      isCompanyShown = false;
      isFlutterShown = true;
    });
    return new Timer(Duration(seconds: 3), onCompanyLogo);
  }

  onCompanyLogo() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(title: "Hello World!",))
    );
  }

  @override
  Widget build(BuildContext context) {
    //This will remove all the system bars
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Stack(children: <Widget>[
      Container(
        child: Center(
          child: AnimatedOpacity(
            opacity: isCompanyShown ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: svgCompanyLogo,
          ),
        ),
      ),
      Container(
        child: Center(
          child: AnimatedOpacity(
            opacity: isFlutterShown ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: svgFlutterLogo,
          ),
        ),
      ),
    ]);
  }
}
