class CategoryListResponse {
  Success? success;
  Contents? contents;
  String? baseurl;
  Copyright? copyright;

  CategoryListResponse(
      {this.success, this.contents, this.baseurl, this.copyright});

  CategoryListResponse.fromJson(Map<dynamic, dynamic> json) {
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
  List<Categories>? categories;

  Contents({this.categories});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? name;
  String? title;
  String? description;
  String? language;
  String? background;

  Categories(
      {this.name,
        this.title,
        this.description,
        this.language,
        this.background});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    description = json['description'];
    language = json['language'];
    background = json['background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['description'] = this.description;
    data['language'] = this.language;
    data['background'] = this.background;
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
