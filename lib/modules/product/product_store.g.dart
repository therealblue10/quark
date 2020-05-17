// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  final _$selectedRankingTypeAtom =
      Atom(name: '_ProductStore.selectedRankingType');

  @override
  String get selectedRankingType {
    _$selectedRankingTypeAtom.reportRead();
    return super.selectedRankingType;
  }

  @override
  set selectedRankingType(String value) {
    _$selectedRankingTypeAtom.reportWrite(value, super.selectedRankingType, () {
      super.selectedRankingType = value;
    });
  }

  final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore');

  @override
  void didChangeSortOption(String type) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.didChangeSortOption');
    try {
      return super.didChangeSortOption(type);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedRankingType: ${selectedRankingType}
    ''';
  }
}
