class Model {
  String? name;
  List<String>? webPages;
  String? country;
  List<String>? domains;
  String? alphaTwoCode;
  String? stateProvince;

  Model(
      {this.name,
        this.webPages,
        this.country,
        this.domains,
        this.alphaTwoCode,
        this.stateProvince});

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    webPages = json['web_pages'].cast<String>();
    country = json['country'];
    domains = json['domains'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['web_pages'] = this.webPages;
    data['country'] = this.country;
    data['domains'] = this.domains;
    data['alpha_two_code'] = this.alphaTwoCode;
    data['state-province'] = this.stateProvince;
    return data;
  }
}
