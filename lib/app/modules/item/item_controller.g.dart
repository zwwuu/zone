// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ItemController = BindInject(
  (i) => ItemController(i<ItemRepository>(), i<ShareService>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemControllerBase, Store {
  final _$isViewingCommentAtom =
      Atom(name: '_ItemControllerBase.isViewingComment');

  @override
  bool get isViewingComment {
    _$isViewingCommentAtom.reportRead();
    return super.isViewingComment;
  }

  @override
  set isViewingComment(bool value) {
    _$isViewingCommentAtom.reportWrite(value, super.isViewingComment, () {
      super.isViewingComment = value;
    });
  }

  final _$_ItemControllerBaseActionController =
      ActionController(name: '_ItemControllerBase');

  @override
  void switchView() {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.switchView');
    try {
      return super.switchView();
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchItem(String id) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.fetchItem');
    try {
      return super.fetchItem(id);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isViewingComment: ${isViewingComment}
    ''';
  }
}
