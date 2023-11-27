enum BoxEnum {
  settings,
  pills,
  informations,
  contacts,
}

extension BoxEnumName on BoxEnum {
  String get name {
    switch (this) {
      case BoxEnum.contacts:
        return "contacts";
      case BoxEnum.settings:
        return "settings";
      case BoxEnum.pills:
        return "pills";
      case BoxEnum.informations:
        return "informations";
    }
  }
}
