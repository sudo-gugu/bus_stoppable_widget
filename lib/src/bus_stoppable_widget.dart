import 'event_bus.dart';
import 'package:flutter/widgets.dart';

class BusStoppableWidget extends StatefulWidget {
  const BusStoppableWidget({super.key});

  @override
  BusStoppableState createState() => BusStoppableState();
}

class BusStoppableState<T extends BusStoppableWidget> extends State<T> {
  final EventBus _eventBus = EventBus();
  final Map<String, Function> _eventMap = {};

  @override
  void dispose() {
    _eventMap
        .forEach((event, callback) => _eventBus.unsubscribe(event, callback));
    _eventMap.clear();
    super.dispose();
  }

  void subscribe(String event, Function callback) {
    _eventMap[event] = callback;
    _eventBus.subscribe(event, callback);
  }

  void unsubscribe(String event) {
    final callback = _eventMap.remove(event);
    if (callback != null) {
      _eventBus.unsubscribe(event, callback);
    }
  }

  void publish(String event, [dynamic data]) {
    _eventBus.publish(event, data);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
