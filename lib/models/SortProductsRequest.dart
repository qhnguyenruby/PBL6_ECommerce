class SortProductsRequest {
  final int pageIndex;
  final int pageSize;
  final int productId;
  final String keyWord;
  final int categoryId;
  final int gender;
  final int shopId;
  final String sortBy;

  SortProductsRequest({
    required this.pageIndex,
    required this.pageSize,
    this.productId = 0,
    this.keyWord = "",
    this.categoryId = 0,
    this.gender = 0,
    this.shopId = 0,
    this.sortBy = "",
  });
}
