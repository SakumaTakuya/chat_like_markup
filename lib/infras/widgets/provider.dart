import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:provider/provider.dart';

class NotifierProvider<T extends StateNotifier<U>, U> extends StatelessWidget {
  const NotifierProvider(
      {@required this.childbuilder, @required this.notifier});
  final Create<Widget> childbuilder;
  final T notifier;

  @override
  Widget build(BuildContext context) => StateNotifierProvider<T, U>.value(
        value: notifier,
        child: Builder(
          builder: childbuilder,
        ),
      );
}

typedef Widget WatchChildBuilderCallback<T>(BuildContext context, T data);

class Watcher<T> extends StatelessWidget {
  const Watcher({@required this.childbuilder});
  final WatchChildBuilderCallback<T> childbuilder;

  @override
  Widget build(BuildContext context) => childbuilder(
        context,
        context.watch<T>(),
      );
}

class Reader {
  static T of<T>(BuildContext context) => context.read<T>();
}

typedef U SelectorCallback<T, U>(T data);

class Selector<T, U> extends StatelessWidget {
  const Selector({
    @required this.childbuilder,
    @required this.selector,
  });
  final WatchChildBuilderCallback<U> childbuilder;
  final SelectorCallback<T, U> selector;

  @override
  Widget build(BuildContext context) => childbuilder(
        context,
        context.select<T, U>(selector),
      );
}
