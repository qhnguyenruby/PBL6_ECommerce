class SearchProductsRequest {
  final int pageIndex;
  final int pageSize;
  final String sortBy;
  final String key;

  SearchProductsRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.sortBy,
    required this.key,
  });
}
