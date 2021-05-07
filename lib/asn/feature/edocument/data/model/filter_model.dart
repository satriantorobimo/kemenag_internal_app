class FilterModel {
  int id;
  String name;
  FilterModel(this.id, this.name);
  static List<FilterModel> getFilter() {
    return <FilterModel>[FilterModel(1, 'Name'), FilterModel(3, 'Size')];
  }
}
