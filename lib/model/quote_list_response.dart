class QuoteListResponse {
  Success? success;
  Contents? contents;
  String? baseurl;
  Copyright? copyright;

  QuoteListResponse(
      {this.success, this.contents, this.baseurl, this.copyright});

  QuoteListResponse.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? new Success.fromJson(json['success']) : null;
    contents = json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null;
    baseurl = json['baseurl'];
    copyright = json['copyright'] != null
        ? new Copyright.fromJson(json['copyright'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.toJson();
    }
    if (this.contents != null) {
      data['contents'] = this.contents!.toJson();
    }
    data['baseurl'] = this.baseurl;
    if (this.copyright != null) {
      data['copyright'] = this.copyright!.toJson();
    }
    return data;
  }
}

class Success {
  int? total;

  Success({this.total});

  Success.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}

class Contents {
  Categories? categories;

  Contents({this.categories});

  Contents.fromJson(Map<String, dynamic> json) {
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    return data;
  }
}

class Categories {
  String? art;
  String? funny;
  String? inspire;
  String? life;
  String? love;
  String? management;
  String? sports;
  String? students;

  Categories(
      {this.art,
        this.funny,
        this.inspire,
        this.life,
        this.love,
        this.management,
        this.sports,
        this.students});

  Categories.fromJson(Map<String, dynamic> json) {
    art = json['art'];
    funny = json['funny'];
    inspire = json['inspire'];
    life = json['life'];
    love = json['love'];
    management = json['management'];
    sports = json['sports'];
    students = json['students'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['art'] = this.art;
    data['funny'] = this.funny;
    data['inspire'] = this.inspire;
    data['life'] = this.life;
    data['love'] = this.love;
    data['management'] = this.management;
    data['sports'] = this.sports;
    data['students'] = this.students;
    return data;
  }
}

class Copyright {
  int? year;
  String? url;

  Copyright({this.year, this.url});

  Copyright.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['url'] = this.url;
    return data;
  }
}
