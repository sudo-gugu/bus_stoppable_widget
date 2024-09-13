class EventBus {
  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;
  EventBus._internal();

  final Map<String, List<Function>> _listenerList = {};

  void subscribe(String eventName, Function callback) {
    if (!_listenerList.containsKey(eventName)) {
      _listenerList[eventName] = [];
    }
    _listenerList[eventName]!.add(callback);
  }

  void unsubscribe(String eventName, Function callback) {
    if (_listenerList.containsKey(eventName)) {
      _listenerList[eventName]!.remove(callback);
    }
  }

  void publish(String eventName, [dynamic data]) {
    if (_listenerList.containsKey(eventName)) {
      for (var callback in _listenerList[eventName]!) {
        callback(data);
      }
    }
  }
}
