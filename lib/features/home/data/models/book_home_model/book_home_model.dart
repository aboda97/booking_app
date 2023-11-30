import 'package:equatable/equatable.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookHomeModel extends Equatable {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
  final SearchInfo searchInfo;

  const BookHomeModel({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  factory BookHomeModel.fromJson(Map<String, dynamic> json) => BookHomeModel(
        kind: json['kind'] as String,
        id: json['id'] as String,
        etag: json['etag'] as String,
        selfLink: json['selfLink'] as String,
        volumeInfo:
            VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo:
            AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
        searchInfo:
            SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo.toJson(),
        'saleInfo': saleInfo.toJson(),
        'accessInfo': accessInfo.toJson(),
        'searchInfo': searchInfo.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      kind,
      id,
      etag,
      selfLink,
      volumeInfo,
      saleInfo,
      accessInfo,
      searchInfo,
    ];
  }
}
