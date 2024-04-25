import 'dart:async';

class CommandManager {
  static final List<String> _commands = [];
  static final _commandStreamController = StreamController<List<String>>.broadcast();
  static const int _maxCommands = 50;

  static void initialize() {
    _commandStreamController.add(_commands);
  }

  static void addCommand(String command) {
    if (_commands.length == _maxCommands) {
      _commands.removeAt(0);
    }
    _commands.add(command);
    _commandStreamController.add(List.unmodifiable(_commands));
  }

  static Stream<List<String>> get commandsStream => _commandStreamController.stream;
}