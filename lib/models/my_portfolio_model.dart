class MyPortfolioModel {
  final BioData? bioData;
  final List<Experience>? experiences;
  final List<Education>? educations;
  final List<Skill>? skills;
  final List<Project>? projects;
  final List<Language>? languages;
  final List<Testimonies>? interests;

  MyPortfolioModel({
    this.bioData,
    this.experiences,
    this.educations,
    this.skills,
    this.projects,
    this.languages,
    this.interests,
  });
}

class Testimonies {}

class Language {}

class Project {}

class Skill {}

class Education {}

class Experience {}

class BioData {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? profilePictureUrl;
  final String? executiveSummary;

  BioData(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
    this.profilePictureUrl,
    this.executiveSummary,
  );
}
