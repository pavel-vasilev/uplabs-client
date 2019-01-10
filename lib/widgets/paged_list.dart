import 'package:flutter/material.dart';

class PagedList<T> extends StatefulWidget {
  final List<T> initialData;

  final int startPage;

  final Future<List<T>> Function(int page) onLoadMore;

  final ListView Function(BuildContext context, List<T> data) builder;

  PagedList({this.initialData, this.startPage, this.onLoadMore, this.builder});

  @override
  State<StatefulWidget> createState() => PagedListState();
}

class PagedListState<T> extends State<PagedList<T>> {
  int currentPage;

  bool isLoading;

  List<T> data;

  @override
  void initState() {
    super.initState();
    currentPage = widget.startPage ?? 1;
    isLoading = false;
    data = widget.initialData ?? [];
    if (widget.initialData == null) {
      loadNewPage();
    }
  }

  void loadNewPage() async {
    setState(() {
      isLoading = true;
    });
    var response = await widget.onLoadMore(currentPage);
    setState(() {
      isLoading = false;
      data = []..addAll(data)..addAll(response);
      currentPage = currentPage + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        var metrics = notification.metrics;
        if (!isLoading && metrics.pixels >= metrics.maxScrollExtent) {
          loadNewPage();
        }
      },
      child: widget.builder(context, data),
    );
  }
}