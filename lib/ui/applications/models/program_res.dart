import 'unversity_course.dart';

class ProgramsPaginated {
  int currentPage;
  List<Program> programs;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link> links;
  String? nextPageUrl;
  String path;
  int perPage;
  String? prevPageUrl;
  int? to;
  int total;

  ProgramsPaginated({
    required this.currentPage,
    required this.programs,
    this.firstPageUrl,
    required this.from,
    this.lastPage,
    this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    this.to,
    required this.total,
  });

  factory ProgramsPaginated.fromJson(Map<String, dynamic> json) {
    return ProgramsPaginated(
      currentPage: json['current_page'],
      programs: (json['data'] as List).map((p) => Program.fromJson(p)).toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: (json['links'] as List).map((e) => Link.fromJson(e)).toList(),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['data'] = programs.map((v) => v.toJson()).toList();
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['links'] = links.map((v) => v.toJson()).toList();
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class StudentAppliedPrograms {
  final List<Program> submitted;
  final List<Program> accepted;
  final List<Program> rejected;
  final List<Program> enrolled;

  StudentAppliedPrograms({
    required this.submitted,
    required this.accepted,
    required this.rejected,
    required this.enrolled,
  });

  factory StudentAppliedPrograms.fromJson(Map<String, dynamic> json) {
    return StudentAppliedPrograms(
      submitted: (json['Submitted'] as List)
          .map((p) => Program.fromMapWithLetters(p))
          .toList(),
      accepted: (json['Accepted'] as List)
          .map((p) => Program.fromMapWithLetters(p))
          .toList(),
      rejected: (json['Rejected'] as List)
          .map((p) => Program.fromMapWithLetters(p))
          .toList(),
      enrolled: (json['Enrolled'] as List)
          .map((p) => Program.fromMapWithLetters(p))
          .toList(),
    );
  }
}

class Program {
  int id;
  int universityId;
  String? uniqueId;
  int facultyId;
  ProgramState status;
  String? countryId;
  String? stateId;
  List<String>? studyType;
  List<String>? studyLanguage;
  String code;
  String? type;
  String name;
  String award;
  String duration;
  String? programECTS;
  List<String>? learningMode;
  String? coverPhotoUrl;
  String? academicDescription;
  String? comment;
  String? createdAt;
  String? updatedAt;
  University university;
  bool isActive;
  String faculty;
  String? deadline;
  String studyLocation;
  String? city;
  List<ApplicationFees> applicationFees;
  List<AdmissionDeadlines> admissionDeadlines;
  List<TuitionFees> tuitionFees;
  Letters? letters;

  Program({
    required this.id,
    required this.universityId,
    this.uniqueId,
    required this.facultyId,
    required this.status,
    this.countryId,
    this.stateId,
    this.studyType,
    this.studyLanguage,
    required this.code,
    this.type,
    required this.name,
    required this.award,
    required this.duration,
    this.programECTS,
    this.learningMode,
    this.coverPhotoUrl,
    this.academicDescription,
    this.comment,
    this.createdAt,
    this.updatedAt,
    required this.university,
    required this.isActive,
    required this.faculty,
    this.deadline,
    required this.studyLocation,
    this.city,
    required this.applicationFees,
    required this.admissionDeadlines,
    required this.tuitionFees,
    this.letters,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    print('ProgramData ===> ${json['tuition_fees']}');
    return Program(
      id: json['id'],
      universityId: json['university_id'],
      uniqueId: json['unique_id'],
      facultyId: json['faculty_id'],
      status: ProgramState.from[json['status']],
      countryId: json['country_id'],
      stateId: json['state_id'],
      studyType: json['study_type'].cast<String>(),
      studyLanguage: json['study_language'].cast<String>(),
      code: json['program_code'],
      type: json['program_type'],
      name: json['program_name'],
      award: json['program_award'],
      duration: json['program_duration'],
      programECTS: json['program_ECTS'],
      learningMode: json['learning_mode'].cast<String>(),
      coverPhotoUrl: json['cover_photo_url'],
      academicDescription: json['academic_description'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      university: University.fromJson(json['university']),
      isActive: json['is_active'] ?? false,
      faculty: json['faculty'],
      deadline: json['deadline'],
      studyLocation: json['study_location'],
      city: json['city'],
      applicationFees: json['application_fees'] == null
          ? <ApplicationFees>[]
          : (json['application_fees'] as List)
              .map((e) => ApplicationFees.fromJson(e))
              .toList(),
      admissionDeadlines: json['admission_deadlines'] == null
          ? <AdmissionDeadlines>[]
          : (json['admission_deadlines'] as List)
              .map((e) => AdmissionDeadlines.fromJson(e))
              .toList(),
      tuitionFees: json['tuition_fees'] == null
          ? <TuitionFees>[]
          : (json['tuition_fees'] as List)
              .map((e) => TuitionFees.fromJson(e))
              .toList(),
    );
  }

  factory Program.fromMapWithLetters(Map<String, dynamic> json) {
    final programJson = json['program'];
    return Program(
      id: programJson['id'],
      universityId: programJson['university_id'],
      uniqueId: programJson['unique_id'],
      facultyId: programJson['faculty_id'],
      status: ProgramState.from[programJson['status']],
      countryId: programJson['country_id'],
      stateId: programJson['state_id'],
      studyType: programJson['study_type'].cast<String>(),
      studyLanguage: programJson['study_language'].cast<String>(),
      code: programJson['program_code'],
      type: programJson['program_type'],
      name: programJson['program_name'],
      award: programJson['program_award'],
      duration: programJson['program_duration'],
      programECTS: programJson['program_ECTS'],
      learningMode: programJson['learning_mode'].cast<String>(),
      coverPhotoUrl: programJson['cover_photo_url'],
      academicDescription: programJson['academic_description'],
      comment: programJson['comment'],
      createdAt: programJson['created_at'],
      updatedAt: programJson['updated_at'],
      university: University.fromJson(programJson['university']),
      isActive: programJson['is_active'] ?? false,
      faculty: programJson['faculty'],
      deadline: programJson['deadline'],
      studyLocation: programJson['study_location'],
      city: programJson['city'],
      letters: Letters.fromJson(json['letters']),
      applicationFees: programJson['application_fees'] == null
          ? <ApplicationFees>[]
          : (programJson['application_fees'] as List)
              .map((e) => ApplicationFees.fromJson(e))
              .toList(),
      admissionDeadlines: programJson['admission_deadlines'] == null
          ? <AdmissionDeadlines>[]
          : (programJson['admission_deadlines'] as List)
              .map((e) => AdmissionDeadlines.fromJson(e))
              .toList(),
      tuitionFees: programJson['tuition_fees'] == null
          ? <TuitionFees>[]
          : (programJson['tuition_fees'] as List)
              .map((e) => TuitionFees.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['university_id'] = universityId;
    data['unique_id'] = uniqueId;
    data['faculty_id'] = facultyId;
    data['status'] = status;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['study_type'] = studyType;
    data['study_language'] = studyLanguage;
    data['program_code'] = code;
    data['program_type'] = type;
    data['program_name'] = name;
    data['program_award'] = award;
    data['program_duration'] = duration;
    data['program_ECTS'] = programECTS;
    data['learning_mode'] = learningMode;
    data['cover_photo_url'] = coverPhotoUrl;
    data['academic_description'] = academicDescription;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    // if (university != null) {
    data['university'] = university.toJson();
    // }
    data['is_active'] = isActive;
    data['faculty'] = faculty;
    data['deadline'] = deadline;
    data['study_location'] = studyLocation;
    data['city'] = city;
    data['application_fees'] = applicationFees.map((v) => v.toJson()).toList();
    data['admission_deadlines'] =
        admissionDeadlines.map((v) => v.toJson()).toList();
    data['tuition_fees'] = tuitionFees.map((v) => v.toJson()).toList();
    return data;
  }
}

class University {
  int id;
  String name;
  String? type;
  String? uniqueId;
  String? registeredDate;
  String? address;
  String? countryId;
  String? stateId;
  String? postalCode;
  String? coverPhotoUrl;
  String? locationTitle;
  String? locationDescription;
  String? mediaUrl;
  String? audioUrl;
  int? hotspotX;
  int? hotspotY;
  String? hotspotContent;
  String? verification;
  bool active;
  String createdAt;
  String updatedAt;
  String country;
  String city;

  University({
    required this.id,
    required this.name,
    this.type,
    this.uniqueId,
    this.registeredDate,
    this.address,
    this.countryId,
    this.stateId,
    this.postalCode,
    this.coverPhotoUrl,
    this.locationTitle,
    this.locationDescription,
    this.mediaUrl,
    this.audioUrl,
    this.hotspotX,
    this.hotspotY,
    this.hotspotContent,
    this.verification,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.country,
    required this.city,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      uniqueId: json['unique_id'],
      registeredDate: json['registered_date'],
      address: json['address'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      postalCode: json['postal_code'],
      coverPhotoUrl: json['cover_photo_url'],
      locationTitle: json['location_title'],
      locationDescription: json['location_description'],
      mediaUrl: json['media_url'],
      audioUrl: json['audio_url'],
      hotspotX: json['hotspot_x'],
      hotspotY: json['hotspot_y'],
      hotspotContent: json['hotspot_content'],
      verification: json['verification'],
      active: json['active'] == 1 ? true : false,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      country: json['country'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['unique_id'] = uniqueId;
    data['registered_date'] = registeredDate;
    data['address'] = address;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['postal_code'] = postalCode;
    data['cover_photo_url'] = coverPhotoUrl;
    data['location_title'] = locationTitle;
    data['location_description'] = locationDescription;
    data['media_url'] = mediaUrl;
    data['audio_url'] = audioUrl;
    data['hotspot_x'] = hotspotX;
    data['hotspot_y'] = hotspotY;
    data['hotspot_content'] = hotspotContent;
    data['verification'] = verification;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['country'] = country;
    data['city'] = city;
    return data;
  }
}

class ApplicationFees {
  int id;
  String programId;
  String? studentType;
  String amount;
  String? description;
  String createdAt;
  String updatedAt;

  ApplicationFees({
    required this.id,
    required this.programId,
    this.studentType,
    required this.amount,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ApplicationFees.fromJson(Map<String, dynamic> json) {
    return ApplicationFees(
      id: json['id'],
      programId: json['program_id'],
      studentType: json['student_type'],
      amount: json['amount'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['program_id'] = programId;
    data['student_type'] = studentType;
    data['amount'] = amount;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AdmissionDeadlines {
  int id;
  String programId;
  String? semesterName;
  String? description;
  String startDate;
  String endDate;
  String? createdAt;
  String? updatedAt;

  AdmissionDeadlines({
    required this.id,
    required this.programId,
    this.semesterName,
    this.description,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdmissionDeadlines.fromJson(Map<String, dynamic> json) {
    return AdmissionDeadlines(
      id: json['id'],
      programId: json['program_id'],
      semesterName: json['semester_name'],
      description: json['description'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['program_id'] = programId;
    data['semester_name'] = semesterName;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class TuitionFees {
  int id;
  String programId;
  String? studentType;
  String? paymentType;
  String? amount;
  String? afterScholarship;
  String? scholarshipPercent;
  String? comment;
  String? createdAt;
  String? updatedAt;

  TuitionFees({
    required this.id,
    required this.programId,
    this.studentType,
    this.paymentType,
    required this.amount,
    this.afterScholarship,
    this.scholarshipPercent,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TuitionFees.fromJson(Map<String, dynamic> json) {
    return TuitionFees(
      id: json['id'],
      programId: json['program_id'],
      studentType: json['student_type'],
      paymentType: json['payment_type'],
      amount: json['amount'].toString(),
      afterScholarship: json['after_scholarship'].toString(),
      scholarshipPercent: json['scholarship_percent'].toString(),
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['program_id'] = programId;
    data['student_type'] = studentType;
    data['payment_type'] = paymentType;
    data['amount'] = amount;
    data['after_scholarship'] = afterScholarship;
    data['scholarship_percent'] = scholarshipPercent;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Link {
  String? url;
  String? label;
  bool active;

  Link({this.url, this.label, required this.active});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class Letters {
  final DecisionLetter? conditional;
  final DecisionLetter? acceptance;
  final DecisionLetter? rejection;
  final DecisionLetter? data;

  Letters({this.conditional, this.acceptance, this.rejection, this.data});

  factory Letters.fromJson(Map<String, dynamic> json) {
    return Letters(
      conditional: json['conditional_letter'] != null
          ? DecisionLetter(
              name: 'Conditional Letter',
              url: json['conditional_letter'],
            )
          : null,
      rejection: json['rejection_letter'] != null
          ? DecisionLetter(
              name: 'Rejection Letter',
              url: json['rejection_letter'],
            )
          : null,
      acceptance: json['acceptance_letter'] != null
          ? DecisionLetter(
              name: 'Acceptence Letter',
              url: json['acceptance_letter'],
            )
          : null,
      data: json['conditional_letter'] != null
          ? DecisionLetter(
              name: 'Conditional Letter',
              url: json['conditional_letter'],
            )
          : json['rejection_letter'] != null
              ? DecisionLetter(
                  name: 'Rejection Letter',
                  url: json['rejection_letter'],
                )
              : json['acceptance_letter'] != null
                  ? DecisionLetter(
                      name: 'Acceptence Letter',
                      url: json['acceptance_letter'],
                    )
                  : null,
    );
  }
}

class DecisionLetter {
  final String name;
  final String url;

  DecisionLetter({required this.name, required this.url});
}
