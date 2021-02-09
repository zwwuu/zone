// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_view_body_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $WebViewBodyController = BindInject(
  (i) => WebViewBodyController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WebViewBodyController on _WebViewBodyControllerBase, Store {
  final _$isLoadingWebContentAtom =
      Atom(name: '_WebViewBodyControllerBase.isLoadingWebContent');

  @override
  bool get isLoadingWebContent {
    _$isLoadingWebContentAtom.reportRead();
    return super.isLoadingWebContent;
  }

  @override
  set isLoadingWebContent(bool value) {
    _$isLoadingWebContentAtom.reportWrite(value, super.isLoadingWebContent, () {
      super.isLoadingWebContent = value;
    });
  }

  @override
  String toString() {
    return '''
isLoadingWebContent: ${isLoadingWebContent}
    ''';
  }
}
