class SearchBox {
  String image;
  String name;
  SearchBox({required this.image, required this.name});
  List<SearchBox> searchList() {
    List<SearchBox> searchList = [];
    searchList.add(SearchBox(
      image: image, 
      name: name
    ));
    searchList.add(SearchBox(
      image: image, 
      name: name
    ));
    searchList.add(SearchBox(
      image: image, 
      name: name
    ));
    searchList.add(SearchBox(
      image: image, 
      name: name
    ));
    return searchList;
  }
}
