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

import 'package:flutter/material.dart';
import 'package:flutter_template/blocs/BaseBloc.dart';
import 'package:flutter_template/blocs/MovieListBloc.dart';
import 'package:flutter_template/features/detail/DetailScreen.dart';
import 'package:flutter_template/models/ItemModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.blocs}) : super(key: key);

  // This widget is the feature.home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final List<BaseBloc> blocs;
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void navigateToDetail(BuildContext context) {
    _incrementCounter();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          title: "Detail Screen",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MovieListBloc movieListBloc = widget.blocs.elementAt(0);

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            //UserWidget(),
            StreamBuilder(
              initialData: movieListBloc.initialData,
              stream: movieListBloc.movieList,
              builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.totalPages.toString());
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()));

              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          movieListBloc.fetchMovieList("top_rated");
          //navigateToDetail(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
