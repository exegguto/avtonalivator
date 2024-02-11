import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme.dart';
import '../../../domain/model/cocktail.dart';
import '../../strings.dart';
import '../../widgets/search_field.dart';
import '../../widgets/sliver_scaffold.dart';
import 'provider.dart';
import 'widgets/background.dart';
import 'widgets/cocktail_list.dart';

export 'provider.dart';

part 'widgets/app_bar.dart';

class CocktailsFragment extends StatefulWidget {
  const CocktailsFragment({super.key});

  @override
  State<CocktailsFragment> createState() => _State();
}

class _State extends State<CocktailsFragment> with TickerProviderStateMixin {
  late TabController controller;
  List<UiCocktail> cocktails = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(initialIndex: 2, length: 3, vsync: this);
    controller.addListener(() {
      final provider = context.read<CocktailsProvider>();
      setState(() {
        provider.item = controller.index;
        cocktails = provider.seeCocktails;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CocktailsProvider>();
    provider.item = controller.index;
    cocktails = provider.seeCocktails;

    return SliverScaffold(
      sliverAppBar: _CocktailsAppBar(
        search: provider.searchCocktail,
        background: CocktailsBackground(cocktails: cocktails),
        controller: controller,
      ),
      // body: FilterCard(  // поле фильтрует список по наличию алкоголя
      //   isActive: provider.useFilter,
      //   onChanged: (v) => provider.setFilter(v, drinks),
      // ),
      bodyBuilder: (_, controller) {
        return CocktailsList(
          cocktails: cocktails,
          controller: controller,
        );
      },
    );
  }
}