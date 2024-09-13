import 'package:flutter/material.dart';
import 'package:bus_stoppable_widget/bus_stoppable_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ExampleApp());
}

class EventList {
  static const String exampleSwitch = 'example-switch';
}

class ExampleApp extends BusStoppableWidget {
  const ExampleApp({super.key});

  @override
  BusStoppableState<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends BusStoppableState<ExampleApp> {
  final Color backgroundColorOn = Colors.green;
  final Color backgroundColorOff = Colors.red;
  final Color textColor = Colors.white;
  bool status = false;

  @override
  void initState() {
    super.initState();
    // SUBSCRIBE WHEN YOU NEED IT
    subscribe(EventList.exampleSwitch, exampleSwitchCallback);
    // UNSUBSCRIBE WHEN YOU NEED IT
    // unsubscribe(EventList.exampleSwitch;
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = status ? backgroundColorOn : backgroundColorOff;
    String text = status ? 'ON' : 'OFF';

    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          // PUBLISH WHEN YOU NEED IT
          onTap: () => publish(EventList.exampleSwitch),
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: backgroundColor,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void exampleSwitchCallback(_) {
    setState(() {
      status = !status;
    });
  }
}
