// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<HomeRepository>(), i<BookmarkRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$feedTypeAtom = Atom(name: '_HomeControllerBase.feedType');

  @override
  FeedType get feedType {
    _$feedTypeAtom.reportRead();
    return super.feedType;
  }

  @override
  set feedType(FeedType value) {
    _$feedTypeAtom.reportWrite(value, super.feedType, () {
      super.feedType = value;
    });
  }

  final _$hasNextPageAtom = Atom(name: '_HomeControllerBase.hasNextPage');

  @override
  bool get hasNextPage {
    _$hasNextPageAtom.reportRead();
    return super.hasNextPage;
  }

  @override
  set hasNextPage(bool value) {
    _$hasNextPageAtom.reportWrite(value, super.hasNextPage, () {
      super.hasNextPage = value;
    });
  }

  final _$feedItemsFutureAtom =
      Atom(name: '_HomeControllerBase.feedItemsFuture');

  @override
  ObservableFuture<dynamic> get feedItemsFuture {
    _$feedItemsFutureAtom.reportRead();
    return super.feedItemsFuture;
  }

  @override
  set feedItemsFuture(ObservableFuture<dynamic> value) {
    _$feedItemsFutureAtom.reportWrite(value, super.feedItemsFuture, () {
      super.feedItemsFuture = value;
    });
  }

  final _$isLoadingNextPageAtom =
      Atom(name: '_HomeControllerBase.isLoadingNextPage');

  @override
  bool get isLoadingNextPage {
    _$isLoadingNextPageAtom.reportRead();
    return super.isLoadingNextPage;
  }

  @override
  set isLoadingNextPage(bool value) {
    _$isLoadingNextPageAtom.reportWrite(value, super.isLoadingNextPage, () {
      super.isLoadingNextPage = value;
    });
  }

  final _$loadFeedItemsAsyncAction =
      AsyncAction('_HomeControllerBase.loadFeedItems');

  @override
  Future<void> loadFeedItems() {
    return _$loadFeedItemsAsyncAction.run(() => super.loadFeedItems());
  }

  final _$loadNextPageAsyncAction =
      AsyncAction('_HomeControllerBase.loadNextPage');

  @override
  Future<void> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  @override
  String toString() {
    return '''
feedType: ${feedType},
hasNextPage: ${hasNextPage},
feedItemsFuture: ${feedItemsFuture},
isLoadingNextPage: ${isLoadingNextPage}
    ''';
  }
}
