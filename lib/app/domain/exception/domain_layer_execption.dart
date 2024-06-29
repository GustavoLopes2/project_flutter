class DomainLayerExecption implements Exception {
  String cause;

  DomainLayerExecption(this.cause);

  @override
  String toString() {
    return cause;
  }
}
