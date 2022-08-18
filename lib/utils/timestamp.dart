class Timestamp {
  static String getCurrentTimeStamp() {
    DateTime _now = DateTime.now();
    return ' timestamp: ${_now.hour}:${_now.minute}:${_now.second}.${_now.millisecond}';
  }
}