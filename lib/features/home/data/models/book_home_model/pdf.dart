import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  final bool isAvailable;
  final String acsTokenLink;

  const Pdf({required this.isAvailable, required this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
        isAvailable: json['isAvailable'] as bool,
        acsTokenLink: json['acsTokenLink'] as String,
      );

  Map<String, dynamic> toJson() => {
        'isAvailable': isAvailable,
        'acsTokenLink': acsTokenLink,
      };

  @override
  List<Object?> get props => [isAvailable, acsTokenLink];
}
