import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/blocs/MovieListBloc.dart';
import 'package:flutter_template/models/ItemModel.dart';

class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserWidgetState();
  }
}

class _UserWidgetState extends State<UserWidget> {
  final movieListBloc = MovieListBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //initialData: movieListBloc.movieList,
      stream: movieListBloc.movieList,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return _buildLoadingWidget();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Container(padding: EdgeInsets.all(20.0), child: Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Loading data from API..."), CircularProgressIndicator()],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }
}
