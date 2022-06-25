extension RemoveSlash on String {
  String get removeSlash => replaceFirst('/', '');
  String get nameBetweenSlash => split('/')[1];
}
