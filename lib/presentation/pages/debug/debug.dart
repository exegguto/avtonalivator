import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../core/router.dart';
import '../../../core/theme.dart';
import '../../../data/connection/fbs_adapter.dart';
import '../../../domain/model/commandmanager.dart';
import '../../../domain/storage/commands.dart';
import '../../../injection.dart';
import '../../widgets/basic_card.dart';

const double _gap = 8;
const double _commandSize = 12;

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final adapter = get<FbsAdapter>();
  final commands = get<CommandsBox>();

  final logController = TextEditingController();
  final sendController = TextEditingController();

  StreamSubscription<String>? dataSubscription;

  final data = [];

  @override
  void initState() {
    super.initState();
  }

  void sendCommand() {
    final text = sendController.text;
    CommandManager.addCommand('OUT: $text'); // Сохранить команду
    final list = utf8.encode(text);
    final bytes = Uint8List.fromList(list);
    print('sendCommand = $text');
    adapter.send(bytes);
  }

  void saveCommand() {
    setState(() {
      commands.save(sendController.text);
    });
  }

  void setCommand(String command) {
    sendController.text = command;
  }

  void deleteCommand(String command) {
    setState(() {
      commands.delete(command);
    });
  }


  @override
  Widget build(BuildContext context) {
    final commands = this.commands.all;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppRoutes.debug),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: StreamBuilder<List<String>>(
          stream: CommandManager.commandsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final command = snapshot.data![index];
                  return Container(
                    color: Colors.black,
                    child: Text(
                      command,
                      style: TextStyle(
                        color: _getColorFromCommand(command),
                        fontSize: 7,
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No commands yet'));
            }
          },
        ),
      ),
      bottomSheet: Ink(
        color: Color.lerp(AppTheme.background, AppTheme.accent, 0.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (commands.isNotEmpty)
              SizedBox(
                height: _gap * 3 + _commandSize,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(_gap).copyWith(bottom: 0),
                  itemCount: commands.length,
                  itemBuilder: commandBuilder,
                  separatorBuilder: separatorBuilder,
                ),
              ),
            Padding(
              padding: AppTheme.padding,
              child: TextField(
                controller: sendController,
                onEditingComplete: sendCommand,
                decoration: InputDecoration(
                  icon: IconButton(
                    onPressed: saveCommand,
                    icon: const Icon(Icons.save_rounded),
                  ),
                  suffixIcon: IconButton(
                    onPressed: sendCommand,
                    icon: const Icon(Icons.send_outlined),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromCommand(String command) {
    if (command.startsWith('IN')) {
      return Colors.green;
    } else if (command.startsWith('OUT')) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(width: 8);
  }

  Widget commandBuilder(BuildContext context, int index) {
    final command = commands.all[index];

    return GestureDetector(
      onLongPress: () => deleteCommand(command),
      child: BasicCard(
        onTap: () => setCommand(command),
        color: AppTheme.accent,
        padding: const EdgeInsets.all(_gap),
        child: Text(
          command,
          style: const TextStyle(fontSize: _commandSize, height: 1),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // Отменяем подписку на поток при уничтожении виджета
  //   // _logSubscription?.cancel();
  //   super.dispose();
  // }

}
