class Job {
  final String name;
  final int ratePerHour;
  Job({
    this.name,
    this.ratePerHour,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'ratePerHour': ratePerHour};
  }
}
