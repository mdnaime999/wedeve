import 'package:get/get.dart';

class FilterCheckbox {
  final int id;
  final String title;
  Rx<bool> isActive;
  FilterCheckbox({required this.id, required this.title, required this.isActive});
}

List<FilterCheckbox> filterCheckList = [
  FilterCheckbox(id: 1, title: "Newest", isActive: false.obs),
  FilterCheckbox(id: 2, title: "Oldest", isActive: false.obs),
  FilterCheckbox(id: 3, title: "Price low > High", isActive: false.obs),
  FilterCheckbox(id: 4, title: "Price high > Low", isActive: false.obs),
  FilterCheckbox(id: 5, title: "Best selling", isActive: false.obs),
];
