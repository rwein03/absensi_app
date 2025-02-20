class Storedata {
  final int student_id;
  final DateTime date;
  final String status;
  final String reasson;
  final String? supporting_document;

  Storedata({
    required this.student_id,
    required this.date,
    required this.status,
    required this.reasson,
    this.supporting_document,
  });

  factory Storedata.fromJson(Map<String, dynamic> json) => Storedata(
      student_id: json['student_id'],
      date: json['date'],
      status: json['status'],
      reasson: json['reasson'],
      supporting_document: json['supporting_document']);

  Map<String, dynamic> toJson() => {
        "student_id": student_id,
        "date": date,
        "status": status,
        "reasson": reasson,
        'supporting_document': supporting_document
      };

  @override
  String toString() {
    return '(student_id: $student_id, date: $date, status: $status, reasson: $reasson, supporting_document: $supporting_document)';
  }
}
