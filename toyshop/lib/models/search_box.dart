class SearchBox {
  String name;
  SearchBox({required this.name});
  static List<SearchBox> searchBox() {
     List<SearchBox> searchBox = [];
    searchBox.add(SearchBox(
      name: "Trending"
    ));
    searchBox.add(SearchBox(
      name: "Best Selling"
    ));
    searchBox.add(SearchBox(
      name: "Newest"
    ));
    searchBox.add(SearchBox( 
      name: "Oldest"
    ));
    return searchBox;
  }
}
