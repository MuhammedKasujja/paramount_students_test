import 'package:equatable/equatable.dart';

class PickedFile extends Equatable {
  final String? filePath0;
  final String? fileName0;
  final String? userFileName0;
  final String? userFileName1;
  final String? userFileName2;
  final String? userFileName3;
  final String? userFileName4;
  final int? fileSize0;
  final String? filePath1;
  final String? fileName1;
  final int? fileSize1;
  final String? filePath2;
  final String? fileName2;
  final int? fileSize2;
  final String? filePath3;
  final String? fileName3;
  final int? fileSize3;
  final String? filePath4;
  final String? fileName4;
  final int? fileSize4;


  const PickedFile({
    this.filePath0,
    this.filePath1,
    this.filePath2,
    this.filePath3,
    this.filePath4,
    this.fileName0,
    this.fileName1,
    this.fileName2,
    this.fileName3,
    this.fileName4,
    this.fileSize0,
    this.fileSize1,
    this.fileSize2,
    this.fileSize3,
    this.fileSize4,
    this.userFileName0,
    this.userFileName1,
    this.userFileName2,
    this.userFileName3,
    this.userFileName4
  });

  Map<dynamic, dynamic> toMap() => {
        "filePath0": filePath0,
        "fileName0": fileName0,
        "filePath1": filePath1,
        "fileName1": fileName1,
        "filePath2": filePath2,
        "fileName2": fileName2,
        "filePath3": filePath3,
        "fileName3": fileName3,
        "filePath4": filePath4,
        "fileName4": fileName4,
        "fileSize0": fileSize0,
        "fileSize1": fileSize1,
        "fileSize2": fileSize2,
        "fileSize3": fileSize3,
        "fileSize4": fileSize4,
        "user_fileName0": userFileName0,
        "user_fileName1": userFileName1,
        "user_fileName2": userFileName2,
        "user_fileName3": userFileName3,
        "user_fileName4": userFileName4
      };

  factory PickedFile.fromMap(Map<dynamic, dynamic> data) => PickedFile(
        fileName0: data['fileName0'] as String?,
        filePath0: data['filePath0'] as String?,
        filePath1: data['filePath1'] as String?,
        fileName1: data['fileName1'] as String?,
        filePath2: data['filePath2'] as String?,
        fileName2: data['fileName2'] as String?,
        fileName3: data['fileName3'] as String?,
        filePath3: data['filePath3'] as String?,
        fileName4: data['fileName4'] as String?,
        filePath4: data['filePath4'] as String?,
        fileSize0: data['fileSize0'] as int?,
        fileSize1: data['fileSize1'] as int?,
        fileSize2: data['fileSize2'] as int?,
        fileSize3: data['fileSize3'] as int?,
        fileSize4: data['fileSize4'] as int?,
        userFileName0: data['user_fileName0'] as String?,
        userFileName1: data['user_fileName1'] as String?,
        userFileName2: data['user_fileName2'] as String?,
        userFileName3: data['user_fileName3'] as String?,
        userFileName4: data['user_fileName4'] as String?,

      );

  PickedFile copyWith({
    String? filePath0,
    String? fileName0,
    String? filePath1,
    String? fileName1,
    String? filePath2,
    String? fileName2,
    String? filePath3,
    String? fileName3,
    String? filePath4,
    String? fileName4,
    String? userFileName0,
    String? userFileName1,
    String? userFileName2,
    String? userFileName3,
    String? userFileName4,
    int? fileSize0,
    int? fileSize1,
    int? fileSize2,
    int? fileSize3,
    int? fileSize4,
  }) {
    return PickedFile(
      filePath0: filePath0 ?? this.filePath0,
      fileName0: fileName0 ?? this.fileName0,
      filePath1: filePath1 ?? this.filePath1,
      fileName1: fileName1 ?? this.fileName1,
      filePath2: filePath2 ?? this.filePath2,
      fileName2: fileName2 ?? this.fileName2,
      filePath3: filePath3 ?? this.filePath3,
      fileName3: fileName3 ?? this.fileName3,
      filePath4: filePath4 ?? this.filePath4,
      fileName4: fileName4 ?? this.fileName4,
      fileSize0: fileSize0 ?? this.fileSize0,
      fileSize1: fileSize1 ?? this.fileSize1,
      fileSize2: fileSize2 ?? this.fileSize2,
      fileSize3: fileSize3 ?? this.fileSize3,
      fileSize4: fileSize4 ?? this.fileSize4,
      userFileName0: userFileName0 ?? this.userFileName0,
      userFileName1: userFileName1 ?? this.userFileName1,
      userFileName2: userFileName2 ?? this.userFileName2,
      userFileName3: userFileName3 ?? this.userFileName3,
      userFileName4: userFileName4 ?? this.userFileName4
    );
  }

  @override
  List<Object?> get props {
    return [
      filePath0,
      fileName0,
      filePath1,
      fileName1,
      filePath2,
      fileName2,
      filePath3,
      fileName3,
      filePath4,
      fileName4,
      fileSize0,
      fileSize3,
      fileSize2,
      fileSize1,
      fileSize4,
      userFileName0,
      userFileName1,
      userFileName2,
      userFileName3,
      userFileName4
    ];
  }
}
