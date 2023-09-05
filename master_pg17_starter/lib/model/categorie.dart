import '../commons/constant_assets.dart';

class Categorie {
  int? _id;
  String? _libelle;
  String? _iconName;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get libelle => _libelle;
  String? get iconName => _iconName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Categorie({
    int? id,
    String? libelle,
    String? iconName,String? createdAt,
    String? updatedAt}){
    _id = id;
    _libelle = libelle;
    _iconName = iconName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Categorie.fromJson(dynamic json){
    _id = json["id"];
    _libelle = json["libelle"];
    _iconName = json["icon_name"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["libelle"] = _libelle;
    map["icon_name"] = _iconName;
    map["created_at"] = _createdAt;
    map["id"] = _updatedAt;

    return map;
  }
}

//Sample Data
/*
List<Categorie> categories = [
  Categorie(id: 1, libelle: 'Informatique', iconName: kIconCategorieInfo),
  Categorie(id: 1, libelle: 'Téléphone', iconName: kIconCategoriePhone),
  Categorie(id: 1, libelle: 'Electroménager', iconName: kIconCategorieElectro),
  Categorie(id: 1, libelle: 'Cosmétique', iconName: kIconCategorieCosmetique),
  Categorie(id: 1, libelle: 'Cosmétique', iconName: kIconCategorieCosmetique),
];*/
