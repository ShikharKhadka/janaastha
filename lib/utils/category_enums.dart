import 'package:flutter/cupertino.dart';

enum CategoryTabs {
  home,
  recent,
  news,
  politics,
  finance,
  literature,
  health,
  tourism,
  world,
  sports,
  entertainment,
  interviews,
  pradesh,
  pradeshOne,
  pradeshTwo,
  bagmati,
  karnali,
  gandaki,
  farwestern,
  lumbini,
  accident,
  crime,
  variety,
  reader,
  multimedia,
  author,
  others
}

extension CategoryX on CategoryTabs {
  String get nepaliNames {
    switch (this) {
      case CategoryTabs.news:
        return "समाचार";
      case CategoryTabs.politics:
        return "राजनीति";
      case CategoryTabs.finance:
        return "अर्थ";
      case CategoryTabs.literature:
        return "लेख रचना";
      case CategoryTabs.health:
        return "स्वास्थ्य";
      case CategoryTabs.tourism:
        return "पर्यटन";
      case CategoryTabs.world:
        return "बिश्व";
      case CategoryTabs.sports:
        return "खेलकुद";
      case CategoryTabs.entertainment:
        return "मनोरञ्जन";
      case CategoryTabs.interviews:
        return "अन्तर्वार्ता";
      case CategoryTabs.pradesh:
        return "प्रदेश";
      case CategoryTabs.pradeshOne:
        return "प्रदेश-१";
      case CategoryTabs.pradeshTwo:
        return "प्रदेश-२";
      case CategoryTabs.bagmati:
        return "बागमती";
      case CategoryTabs.gandaki:
        return "गण्डकी";
      case CategoryTabs.lumbini:
        return "लुम्बिनी";
      case CategoryTabs.karnali:
        return "कर्णाली";
      case CategoryTabs.farwestern:
        return "सुदूरपश्चिम";
      case CategoryTabs.accident:
        return "दुर्घटना";
      case CategoryTabs.crime:
        return "अपराध";
      case CategoryTabs.variety:
        return "बिबिध";
      case CategoryTabs.reader:
        return "पाठकपत्र";
      case CategoryTabs.multimedia:
        return "मल्टिमिडिया";
      case CategoryTabs.others:
        return "अन्य";
      default:
        return "";
    }
  }

  String get slug {
    switch (this) {
      case CategoryTabs.news:
        return 'main-news';
      case CategoryTabs.literature:
        return 'literature-1';
      case CategoryTabs.interviews:
        return 'interviews';
      case CategoryTabs.pradeshOne:
        return 'pradesh-one';
      case CategoryTabs.pradeshTwo:
        return 'pradesh-two';
      case CategoryTabs.farwestern:
        return 'far-western';
      default:
        return name;
    }
  }

  bool get forExplore {
    switch (this) {
      case CategoryTabs.home:
      case CategoryTabs.author:
      case CategoryTabs.recent:
      case CategoryTabs.pradeshOne:
      case CategoryTabs.pradeshTwo:
      case CategoryTabs.bagmati:
      case CategoryTabs.gandaki:
      case CategoryTabs.lumbini:
      case CategoryTabs.karnali:
      case CategoryTabs.farwestern:
        return false;
      default:
        return true;
    }
  }

  List<CategoryTabs> get subCategories {
    switch (this) {
      case CategoryTabs.pradesh:
        return [
          CategoryTabs.pradeshOne,
          CategoryTabs.pradeshTwo,
          CategoryTabs.bagmati,
          CategoryTabs.gandaki,
          CategoryTabs.lumbini,
          CategoryTabs.karnali,
          CategoryTabs.farwestern
        ];
      default:
        return [];
    }
  }
}
