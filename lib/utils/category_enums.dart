enum CategoryTabs {
  home,
  recent,
  search,
  news,
  politics,
  finance,
  literatureOne,
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
  video,
  author,
  others,
  photoFeature,
  migration,
  insideCity,
  noteOfDescents,
  literature,
  english,
}

extension CategoryX on CategoryTabs {
  String get displayName {
    switch (this) {
      case CategoryTabs.news:
        return "समाचार";
      case CategoryTabs.politics:
        return "राजनीति";
      case CategoryTabs.finance:
        return "अर्थ";
      case CategoryTabs.literatureOne:
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
      case CategoryTabs.video:
        return "मल्टिमिडिया";
      case CategoryTabs.others:
        return "अन्य";
      case CategoryTabs.english:
        return "English";
      case CategoryTabs.photoFeature:
        return "फोटो फिचर";
      case CategoryTabs.literature:
        return "साहित्य";
      case CategoryTabs.migration:
        return "प्रवास";
      case CategoryTabs.insideCity:
        return "शहरभित्र";
      case CategoryTabs.noteOfDescents:
        return "नोट अफ डिसेन्ट";
      default:
        return name;
    }
  }

  String get slug {
    switch (this) {
      case CategoryTabs.news:
        return 'main-news';
      case CategoryTabs.literatureOne:
        return 'literature-1';
      case CategoryTabs.interviews:
        return 'interviews';
      case CategoryTabs.pradeshOne:
        return 'pradesh-one';
      case CategoryTabs.pradeshTwo:
        return 'pradesh-two';
      case CategoryTabs.farwestern:
        return 'far-western';
      case CategoryTabs.insideCity:
        return 'inside-city';
      case CategoryTabs.noteOfDescents:
        return 'note-of-descents';
      case CategoryTabs.photoFeature:
        return 'photo-feature';
      default:
        return name;
    }
  }

  bool get forExplore {
    switch (this) {
      case CategoryTabs.home:
      case CategoryTabs.author:
      case CategoryTabs.search:
      case CategoryTabs.recent:
      case CategoryTabs.pradeshOne:
      case CategoryTabs.pradeshTwo:
      case CategoryTabs.bagmati:
      case CategoryTabs.gandaki:
      case CategoryTabs.lumbini:
      case CategoryTabs.karnali:
      case CategoryTabs.farwestern:
      case CategoryTabs.crime:
      case CategoryTabs.accident:
      case CategoryTabs.photoFeature:
      case CategoryTabs.reader:
      case CategoryTabs.world:
      case CategoryTabs.literature:
      case CategoryTabs.tourism:
      case CategoryTabs.insideCity:
      case CategoryTabs.noteOfDescents:
      case CategoryTabs.migration:
      case CategoryTabs.variety:
        return false;
      default:
        return true;
    }
  }

  bool get hasIcon {
    switch (this) {
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

  bool get getViewName {
    switch (this) {
      case CategoryTabs.search:
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
      case CategoryTabs.others:
        return [
          CategoryTabs.crime,
          CategoryTabs.accident,
          CategoryTabs.photoFeature,
          CategoryTabs.migration,
          CategoryTabs.world,
          CategoryTabs.literature,
          CategoryTabs.tourism,
          CategoryTabs.insideCity,
          CategoryTabs.noteOfDescents,
          CategoryTabs.variety,
        ];
      default:
        return [];
    }
  }
}
