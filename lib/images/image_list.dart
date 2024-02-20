import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment_0/data_provider/DataProvider.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _fetchImages();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Reach the bottom of the list
      Provider.of<DataProvider>(context, listen: false).fetchImages();
    }
  }

  void _fetchImages() {
    Provider.of<DataProvider>(context, listen: false).fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (ctx, dataProvider, _) => ListView.builder(
        controller: _scrollController,
        itemCount: dataProvider.images.length,
        itemBuilder: (ctx, index) {
          return CachedNetworkImage(
            imageUrl: dataProvider.images[index]['url'],
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
      ),
    );
  }
}