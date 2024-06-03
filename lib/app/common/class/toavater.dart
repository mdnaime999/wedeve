class ToAvater {
  ToAvater({required this.name, this.bg = "0D8ABC", this.color = "FFFFFF"});
  String name;
  String bg;
  String color;

  String getUrl() {
    var nameArray = name.replaceAll("+", " ");
    return "https://ui-avatars.com/api/?background=$bg&color=$color&name=$nameArray";
  }
}
