class Rain {
  double? onehour;

  Rain({this.onehour});

  factory Rain.fromJson(Map<String, dynamic>json) => Rain(
    onehour: (json['onehour']).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'onehour': onehour,
  };
}