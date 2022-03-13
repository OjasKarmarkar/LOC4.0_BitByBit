class Diet {
  Meals? meals;
  List<Summary>? summary;

  Diet({this.meals, this.summary});

  Diet.fromJson(Map<String, dynamic> json) {
    meals = json['meals'] != null ? new Meals.fromJson(json['meals']) : null;
    if (json['summary'] != null) {
      summary = <Summary>[];
      json['summary'].forEach((v) {
        summary!.add(new Summary.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.meals != null) {
  //     data['meals'] = this.meals!.toJson();
  //   }
  //   if (this.summary != null) {
  //     data['summary'] = this.summary!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Meals {
  List<m>? meals;
  Nutrients? nutrients;

  Meals({this.meals, this.nutrients});

  Meals.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <m>[];
      json['meals'].forEach((v) {
        meals!.add(new m.fromJson(v));
      });
    }
    nutrients = json['nutrients'] != null
        ? new Nutrients.fromJson(json['nutrients'])
        : null;
  }
}

class m {
  int? id;
  String? imageType;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? title;

  m(
      {this.id,
      this.imageType,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl,
      this.title});

  m.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageType = json['imageType'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageType'] = this.imageType;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['sourceUrl'] = this.sourceUrl;
    data['title'] = this.title;
    return data;
  }
}

class Nutrients {
  double? calories;
  double? carbohydrates;
  double? fat;
  double? protein;

  Nutrients({this.calories, this.carbohydrates, this.fat, this.protein});

  Nutrients.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    carbohydrates = json['carbohydrates'];
    fat = json['fat'];
    protein = json['protein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['carbohydrates'] = this.carbohydrates;
    data['fat'] = this.fat;
    data['protein'] = this.protein;
    return data;
  }
}

class Summary {
  int? id;
  String? summary;
  String? title;

  Summary({this.id, this.summary, this.title});

  Summary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    summary = json['summary'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['summary'] = this.summary;
    data['title'] = this.title;
    return data;
  }
}
