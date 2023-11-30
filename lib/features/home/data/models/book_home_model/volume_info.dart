import 'package:equatable/equatable.dart';

import 'image_links.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo extends Equatable {
  final String title;
  final List<String>? authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final ReadingModes readingModes;
  final int pageCount;
  final String printType;
  final List<String>? categories;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final PanelizationSummary panelizationSummary;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  const VolumeInfo({
    required this.title,
    this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String,
        authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
        publisher: json['publisher'] as String,
        publishedDate: json['publishedDate'] as String,
        description: json['description'] as String,
        readingModes:
            ReadingModes.fromJson(json['readingModes'] as Map<String, dynamic>),
        pageCount: json['pageCount'] as int,
        printType: json['printType'] as String,
        categories: (json['categories'] as List<String>?)?.cast<String>(),
        maturityRating: json['maturityRating'] as String,
        allowAnonLogging: json['allowAnonLogging'] as bool,
        contentVersion: json['contentVersion'] as String,
        panelizationSummary: PanelizationSummary.fromJson(
            json['panelizationSummary'] as Map<String, dynamic>),
        imageLinks:
            ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] as String,
        previewLink: json['previewLink'] as String,
        infoLink: json['infoLink'] as String,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'description': description,
        'readingModes': readingModes.toJson(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'panelizationSummary': panelizationSummary.toJson(),
        'imageLinks': imageLinks.toJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publisher,
      publishedDate,
      description,
      readingModes,
      pageCount,
      printType,
      categories,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
