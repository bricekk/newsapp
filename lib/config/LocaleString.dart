import 'package:get/get.dart';

class LocaleString extends Translations{

  @override
  Map<String, Map<String, String>> get keys =>{
    'en_Us': {
      'lang':"Language",
      'setting': "Settings",
      'themeMode':"Dark Mode",
      'bookmark#black':"Book",
      'bookmark#orange':"marks",
      'nobook':"Your bookmarks collection is empty",
      'search':"Search news",
      'last':"Latest news",
    },
    'fr_FR':{
      'lang':"Langue",
      'setting': "Parametres",
      'themeMode':"Mode sombre",
      'bookmark#black':"Si",
      'bookmark#orange':"gnets",
      'nobook': "Aucun livre ajoute au signet",
      'search':"Rechercher",
      'last':"Actualites",
    }
  };
}