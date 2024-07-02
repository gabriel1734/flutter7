class DadosJSON {
  int s1 = 0;
  String s2 = '';
  String s3 = '';

  DadosJSON({this.s1 = 0, this.s2 = '', this.s3 = ''});

  DadosJSON.fromJson(Map<String, dynamic> json) {
    s1 = json['userId'];
    s2 = json['title'];
    s3 = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    return data;
  }
}
