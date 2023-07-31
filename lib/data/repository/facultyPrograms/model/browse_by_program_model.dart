class BrowseByProgramModel {
  Data data;

  BrowseByProgramModel({required this.data});

  static BrowseByProgramModel fromJson(Map<String, dynamic> json) {
    return BrowseByProgramModel(data: Data.fromJson(json['data']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  bool? error;
  int? statusCode;
  ResponseBody? responseBody;

  Data({this.error, this.statusCode, this.responseBody});

  static Data fromJson(Map<String, dynamic> json) {
    return Data(
      error: json['error'],
      statusCode: json['statusCode'],
      responseBody: ResponseBody.fromJson(json['responseBody']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['statusCode'] = statusCode;
    if (responseBody != null) {
      data['responseBody'] = responseBody!.toJson();
    }
    return data;
  }
}

class ResponseBody {
  int currentPage;
  List<ResponseBodyData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Links> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  ResponseBody(
      {required this.currentPage,
      required this.data,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.links,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total});

  static ResponseBody fromJson(Map<String, dynamic> json) {
    List<Links> links = [];
    List<ResponseBodyData> data = [];
    return ResponseBody(
      currentPage: json['current_page'],
      data: json['data'].forEach((v) {
        data.add(ResponseBodyData.fromJson(v));
      }),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: json['links'].forEach((v) {
        links.add(Links.fromJson(v));
      }),
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['current_page'] = currentPage;
    jsonData['data'] = data.map((v) => v.toJson()).toList();
    jsonData['first_page_url'] = firstPageUrl;
    jsonData['from'] = from;
    jsonData['last_page'] = lastPage;
    jsonData['last_page_url'] = lastPageUrl;
    jsonData['links'] = links.map((v) => v.toJson()).toList();
    jsonData['next_page_url'] = nextPageUrl;
    jsonData['path'] = path;
    jsonData['per_page'] = perPage;
    jsonData['prev_page_url'] = prevPageUrl;
    jsonData['to'] = to;
    jsonData['total'] = total;
    return jsonData;
  }
}

class ResponseBodyData {
  int id;
  int universityId;
  String uniqueId;
  int facultyId;
  String status;
  String countryId;
  String stateId;
  List<String> studyType;
  List<String> studyLanguage;
  String programCode;
  String programType;
  String programName;
  String programAward;
  String programDuration;
  String programECTS;
  List<String> learningMode;
  String coverPhotoUrl;
  String academicDescription;
  String comment;
  String createdAt;
  String updatedAt;
  University university;
  bool isActive;
  String faculty;
  dynamic deadline;
  String studyLocation;
  String city;
  String programFaculty;
  List<ApplicationFees> applicationFees;
  List<AdmissionDeadlines> admissionDeadlines;
  List<TuitionFees> tuitionFees;

  ResponseBodyData(
      {required this.id,
      required this.universityId,
      required this.uniqueId,
      required this.facultyId,
      required this.status,
      required this.countryId,
      required this.stateId,
      required this.studyType,
      required this.studyLanguage,
      required this.programCode,
      required this.programType,
      required this.programName,
      required this.programAward,
      required this.programDuration,
      required this.programECTS,
      required this.learningMode,
      required this.coverPhotoUrl,
      required this.academicDescription,
      required this.comment,
      required this.createdAt,
      required this.updatedAt,
      required this.university,
      required this.isActive,
      required this.faculty,
      required this.deadline,
      required this.studyLocation,
      required this.city,
      required this.programFaculty,
      required this.applicationFees,
      required this.admissionDeadlines,
      required this.tuitionFees});

  static ResponseBodyData fromJson(Map<String, dynamic> json) {
    List<ApplicationFees> appFees = [];
    List<AdmissionDeadlines> adDeadlines = [];
    List<TuitionFees> tutFees = [];
    return ResponseBodyData(
      id: json['id'],
      universityId: json['university_id'],
      uniqueId: json['unique_id'],
      facultyId: json['faculty_id'],
      status: json['status'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      studyType: json['study_type'].cast<String>(),
      studyLanguage: json['study_language'].cast<String>(),
      programCode: json['program_code'],
      programType: json['program_type'],
      programName: json['program_name'],
      programAward: json['program_award'],
      programDuration: json['program_duration'],
      programECTS: json['program_ECTS'],
      learningMode: json['learning_mode'].cast<String>(),
      coverPhotoUrl: json['cover_photo_url'],
      academicDescription: json['academic_description'],
      comment: json['comment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      university: University.fromJson(json['university']),
      isActive: json['is_active'],
      faculty: json['faculty'],
      deadline: json['deadline'],
      studyLocation: json['study_location'],
      city: json['city'],
      programFaculty: json['program_faculty'],
      applicationFees: json['application_fees'].forEach((v) {
        appFees.add(ApplicationFees.fromJson(v));
      }),
      admissionDeadlines: json['admission_deadlines'].forEach((v) {
        adDeadlines.add(AdmissionDeadlines.fromJson(v));
      }),
      tuitionFees: json['tuition_fees'].forEach((v) {
        tutFees.add(TuitionFees.fromJson(v));
      }),
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
    data['program_code'] = programCode;
    data['program_type'] = programType;
    data['program_name'] = programName;
    data['program_award'] = programAward;
    data['program_duration'] = programDuration;
    data['program_ECTS'] = programECTS;
    data['learning_mode'] = learningMode;
    data['cover_photo_url'] = coverPhotoUrl;
    data['academic_description'] = academicDescription;
    data['comment'] = comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['university'] = university.toJson();
    data['is_active'] = isActive;
    data['faculty'] = faculty;
    data['deadline'] = deadline;
    data['study_location'] = studyLocation;
    data['city'] = city;
    data['program_faculty'] = programFaculty;
    data['application_fees'] = applicationFees.map((v) => v.toJson()).toList();
    data['admission_deadlines'] =
        admissionDeadlines.map((v) => v.toJson()).toList();
    data['tuition_fees'] = tuitionFees.map((v) => v.toJson()).toList();
    return data;
  }
}

class University {
  int id;
  dynamic walletNumber;
  String name;
  String type;
  dynamic uniqueId;
  String registeredDate;
  String address;
  String countryId;
  String stateId;
  String postalCode;
  String coverPhotoUrl;
  String locationTitle;
  String locationDescription;
  String mediaUrl;
  String audioUrl;
  int hotspotX;
  int hotspotY;
  String hotspotContent;
  String verification;
  int active;
  String createdAt;
  String updatedAt;
  dynamic overview;
  dynamic ranking;
  dynamic yearlyCost;
  List<String> galleries;
  List<String> virtualTours;
  String country;
  String city;

  University(
      {required this.id,
      required this.walletNumber,
      required this.name,
      required this.type,
      required this.uniqueId,
      required this.registeredDate,
      required this.address,
      required this.countryId,
      required this.stateId,
      required this.postalCode,
      required this.coverPhotoUrl,
      required this.locationTitle,
      required this.locationDescription,
      required this.mediaUrl,
      required this.audioUrl,
      required this.hotspotX,
      required this.hotspotY,
      required this.hotspotContent,
      required this.verification,
      required this.active,
      required this.createdAt,
      required this.updatedAt,
      required this.overview,
      required this.ranking,
      required this.yearlyCost,
      required this.galleries,
      required this.virtualTours,
      required this.country,
      required this.city});

  static University fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'],
      walletNumber: json['wallet_number'],
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
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      overview: json['overview'],
      ranking: json['ranking'],
      yearlyCost: json['yearly_cost'],
      galleries: json['galleries'].cast<String>(),
      virtualTours: json['virtual_tours'].cast<String>(),
      country: json['country'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wallet_number'] = walletNumber;
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
    data['overview'] = overview;
    data['ranking'] = ranking;
    data['yearly_cost'] = yearlyCost;
    data['galleries'] = galleries;
    data['virtual_tours'] = virtualTours;
    data['country'] = country;
    data['city'] = city;
    return data;
  }
}

class ApplicationFees {
  int id;
  String programId;
  String studentType;
  String amount;
  String description;
  String createdAt;
  String updatedAt;

  ApplicationFees(
      {required this.id,
      required this.programId,
      required this.studentType,
      required this.amount,
      required this.description,
      required this.createdAt,
      required this.updatedAt});

  static ApplicationFees fromJson(Map<String, dynamic> json) {
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
  String semesterName;
  String description;
  String startDate;
  String endDate;
  String createdAt;
  String updatedAt;

  AdmissionDeadlines(
      {required this.id,
      required this.programId,
      required this.semesterName,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.createdAt,
      required this.updatedAt});

  static AdmissionDeadlines fromJson(Map<String, dynamic> json) {
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
  String studentType;
  String paymentType;
  int amount;
  double afterScholarship;
  int scholarshipPercent;
  String comment;
  String createdAt;
  String updatedAt;

  TuitionFees(
      {required this.id,
      required this.programId,
      required this.studentType,
      required this.paymentType,
      required this.amount,
      required this.afterScholarship,
      required this.scholarshipPercent,
      required this.comment,
      required this.createdAt,
      required this.updatedAt});

  static TuitionFees fromJson(Map<String, dynamic> json) {
    return TuitionFees(
      id: json['id'],
      programId: json['program_id'],
      studentType: json['student_type'],
      paymentType: json['payment_type'],
      amount: json['amount'],
      afterScholarship: json['after_scholarship'],
      scholarshipPercent: json['scholarship_percent'],
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

class Links {
  String url;
  String label;
  bool active;

  Links({required this.url, required this.label, required this.active});

  static Links fromJson(Map<String, dynamic> json) {
    return Links(
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
