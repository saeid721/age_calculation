class DOBModel {
  final DateTime dateTime;
  final String? label;
  DOBModel({required this.dateTime, this.label});

  Map<String, dynamic> toJson() => {
    'dateTime': dateTime.toIso8601String(),
    'label': label,
  };

  factory DOBModel.fromJson(Map<String, dynamic> json) => DOBModel(
    dateTime: DateTime.parse(json['dateTime'] as String),
    label: json['label'] as String?,
  );
}
