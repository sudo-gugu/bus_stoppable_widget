**ENLGISH**
A tiny(cute) widget where the event bus stops.

**한국어**
이벤트 버스가 멈추는 귀염뽐짝한 위젯.

**日本語**
イベントバスが停車する小さな（かわいい）ウィジェットです。

## FEATURES / 특징 / 特徴
**ENLGISH**
There is a small event bus built in widget.
Subscribe to events when you need them.
And unsubscribe them when you don't need them.

**한국어**
조그마한 이벤트 버스가 위젯에 내장되어있습니다.
필요할 때 이벤트를 구독하고, 필요하지 않으면 취소하세요.

**日本語**
ウィジェットには小さなイベントバスが組み込まれています。
必要なときにイベントをサブスクライブし、不要になったらキャンセルします。

## INSTALL / 설치 / インストール
**ENLGISH**
You're all set with one simple command!

**한국어**
명령어 하나면 모든 준비는 끝!

**日本語**
簡単なコマンド 1 つですべての設定が完了します。

```
flutter pub get bus_stoppable_widget
```

## CREATE / 생성 / 作る
**ENLGISH**
Change the *StatefulWidget* to *BusStoppableWidget*.
And also change the *State* to *BusStoppableState*.

**한국어**
*StatefulWidget*을 *BusStoppableWidget*로 바꿔주세요.
그리고 *State*를 *BusStoppableState*로 바꿔주세요.

**日本語**
*StatefulWidget* を *BusStoppableWidget* に変更します。
また、*State* を *BusStoppableState* に変更します。

## USAGE / 사용 / 使用法
**ENLGISH**
When subscribing to an event, use *subscribe(String, Function(dynamic))*.
Conversely, when unsubscribing to an event, use *unsubscribe(String)*.

Basically, when the widget is Disposed, all registered events are automatically cancelled. In most cases, you can simply subscribe to events when you need them.

**한국어**
이벤트를 구독할 때엔 *subscribe(String, Function(dynamic))* 를 사용합니다.
반대로 이벤트를 구독해지할 때엔 *unsubscribe(String)*를 사용합니다.

기본적으로 해당 위젯이 Dispose 될 때에 등록된 이벤트들은 모두 자동으로 해지합니다. 대부분의 경우 필요할 때에 이벤트를 구독만 해도 됩니다.

**日本語**
イベントをサブスクライブするときは、*subscribe(String, Function(dynamic))* を使用します。
逆に、イベントのサブスクライブを解除する場合は、*unsubscribe(String)* を使用します。

基本的に、ウィジェットを破棄すると、登録されているイベントはすべて自動的にキャンセルされます。ほとんどの場合、必要なときにイベントをサブスクライブするだけで済みます。

```dart
// EVENT : STRING
// CALLBACK : FUNCTION(DYNAMIC)
subscribe(event, callback);
```

```dart
// EVENT : STRING
unsubscribe(event);
```


## EXAMPLE CODE / 예제 코드 / コード例
```dart
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

```

