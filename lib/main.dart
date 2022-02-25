import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spotlas_test/models/spot.dart';
import 'package:spotlas_test/presentation/spot_part.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpotlasFeed(),
    );
  }
}

class SpotlasFeed extends StatefulWidget {
  const SpotlasFeed({Key? key}) : super(key: key);

  @override
  _SpotlasFeedState createState() => _SpotlasFeedState();
}

class _SpotlasFeedState extends State<SpotlasFeed> {
  final Client _client = Client();
  late List<Spot> spots;
  static const _pageSize = 20;
  final PagingController<int, Spot> _pagingController = PagingController(firstPageKey: 1);

  Future<void> getSpots(int page) async {
    final Response result =
        await _client.get(Uri.parse('http://161.35.162.216:1210/interview/home/reel?lat=51.5&lon=-0.17&page=$page'));
    final List<dynamic> data = jsonDecode(result.body);
    spots = data.map((e) => Spot.fromJson(e)).toList();
    final isLastPage = spots.length < _pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(spots);
    } else {
      final nextPage = page + spots.length;
      _pagingController.appendPage(spots, nextPage);
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      getSpots(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (BuildContext context, Spot item, int index) {
            return SpotPart(spot: item);
          },
        ),
      ),
    );
  }
}
