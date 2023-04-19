class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  bool operator ==(covariant Failure other) => message == other.message;

  @override
  int get hashCode => message.hashCode;
}
