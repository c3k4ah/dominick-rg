class SkillModel {
  final String title;
  final String asset;
  final double percent;
  final bool? isPng;

  SkillModel({
    required this.title,
    required this.asset,
    required this.percent,
    this.isPng = false,
  });
}
