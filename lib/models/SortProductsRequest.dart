class SortProductsRequest {
  final int pageIndex;
  final int pageSize;
  final String sortBy;

  SortProductsRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.sortBy,
  });
}
