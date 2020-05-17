// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStore, Store {
  final _$hasDataAtom = Atom(name: '_CategoryStore.hasData');

  @override
  bool get hasData {
    _$hasDataAtom.reportRead();
    return super.hasData;
  }

  @override
  set hasData(bool value) {
    _$hasDataAtom.reportWrite(value, super.hasData, () {
      super.hasData = value;
    });
  }

  final _$allCategoryListAtom = Atom(name: '_CategoryStore.allCategoryList');

  @override
  CategoryList get allCategoryList {
    _$allCategoryListAtom.reportRead();
    return super.allCategoryList;
  }

  @override
  set allCategoryList(CategoryList value) {
    _$allCategoryListAtom.reportWrite(value, super.allCategoryList, () {
      super.allCategoryList = value;
    });
  }

  final _$superCategoryListAtom =
      Atom(name: '_CategoryStore.superCategoryList');

  @override
  List<Category> get superCategoryList {
    _$superCategoryListAtom.reportRead();
    return super.superCategoryList;
  }

  @override
  set superCategoryList(List<Category> value) {
    _$superCategoryListAtom.reportWrite(value, super.superCategoryList, () {
      super.superCategoryList = value;
    });
  }

  final _$productCategoryListAtom =
      Atom(name: '_CategoryStore.productCategoryList');

  @override
  List<Category> get productCategoryList {
    _$productCategoryListAtom.reportRead();
    return super.productCategoryList;
  }

  @override
  set productCategoryList(List<Category> value) {
    _$productCategoryListAtom.reportWrite(value, super.productCategoryList, () {
      super.productCategoryList = value;
    });
  }

  final _$_CategoryStoreActionController =
      ActionController(name: '_CategoryStore');

  @override
  List<Category> filteredProductCategoryList(int index) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.filteredProductCategoryList');
    try {
      return super.filteredProductCategoryList(index);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchProducts() {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.fetchProducts');
    try {
      return super.fetchProducts();
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasData: ${hasData},
allCategoryList: ${allCategoryList},
superCategoryList: ${superCategoryList},
productCategoryList: ${productCategoryList}
    ''';
  }
}
