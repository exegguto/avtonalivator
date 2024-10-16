import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme.dart';
import '../fragments/cocktails/provider.dart';
import '../strings.dart';
import 'text_field_label.dart';

const _padding = AppTheme.padding;

class SearchField extends StatelessWidget {
  static final height = 50 + _padding.vertical;

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CocktailsProvider>();
    return Padding(
      padding: AppTheme.padding,
      child: TextField(
        onChanged: onChanged,
        controller: controller ?? TextEditingController(text: provider.searchPattern),
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          label: Label(Strings.enterName),
        ),
      ),
    );
  }
}
