import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme.dart';
import '../fragments/cocktails/provider.dart';
import '../strings.dart';
import 'text_field_label.dart';

const _padding = AppTheme.padding;

class SearchField extends StatefulWidget {
  static final height = 50 + _padding.vertical;

  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    this.onChanged,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Инициализируем контроллер один раз с текущим значением из провайдера
    final provider = context.read<CocktailsProvider>();
    _controller = TextEditingController(text: provider.searchPattern);

    // Если пользователь изменяет текст в поиске, вызываем onChanged
    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.padding,
      child: TextField(
        controller: _controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          label: Label(Strings.enterName),
        ),
      ),
    );
  }
}