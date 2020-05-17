
abstract class LocalizedLabel {}

class CategoryLabel extends LocalizedLabel  {
    static const screenTitle = 'Category';
}

class ProductCategoryLabel extends LocalizedLabel  {
    static const screenTitle = 'Subcategory';
}

class ProductLabel extends LocalizedLabel  {
    static const screenTitle    = 'Products';
    static const color          = 'Color';
    static const price          = 'Price';
    static const size           = 'Size';
    static const variant        = 'Variant';
}