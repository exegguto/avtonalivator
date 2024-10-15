import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme.dart';
import '../../../domain/model/cocktail.dart';
import '../../pages/home/connection_provider.dart';
import '../../pages/home/pour_modal.dart';
import '../../strings.dart';
import '../cocktails/cocktails.dart';
import 'provider.dart';
import 'widgets/tuning_card.dart';

export 'provider.dart';

class TuningFragment extends StatelessWidget {
  const TuningFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final tuning = context.watch<TuningProvider>();
    final cocktails = context.read<CocktailsProvider>();
    final connection = context.read<ConnectionProvider>();

    final cocktail = tuning.cocktail;

    connection.setCocktail(cocktail);

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: cocktail.name.isNotEmpty ? cocktail.name : Strings.tuning,
                style: AppTheme.pageTitle.copyWith(color: Colors.black),
              ),
              TextSpan(
                text: Strings.totalVolume + context.read<TuningProvider>().getTotalVolume(),
                style: AppTheme.additional.copyWith(
                  color: Colors.black,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _TuningBody(cocktail: cocktail, cocktails: cocktails),
    );
  }
}

class _TuningBody extends StatelessWidget {
  final UiCocktail cocktail;
  final CocktailsProvider cocktails;

  const _TuningBody({
    required this.cocktail,
    required this.cocktails
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    padding: AppTheme.padding,
                    itemCount: cocktail.drinks.length,
                    itemBuilder: itemBuilder,
                    separatorBuilder: separatorBuilder,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<TuningProvider>().increaseCocktailQuantity();
                      },
                      icon: const Icon(Icons.add),
                      label: const Text(Strings.add),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              DialogHelper.showCustomDialog(
                                context,
                                title: Strings.dialogTitle,
                                hintText: Strings.dialogName,
                                onConfirm: (inputText, id) {
                                  if (id == -1) {
                                    cocktails.save(cocktail.copyWith(name: inputText));
                                  } else {
                                    cocktails.updateCocktail(cocktail.copyWith(id: id, name: inputText), -1);
                                  }
                                },
                                onCancel: () {},
                              );
                            },
                            icon: const Icon(Icons.save_rounded),
                            label: const Text(Strings.save),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              context.read<TuningProvider>().defaultCocktail();
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text(Strings.clear),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                startPour(context);
              },
              icon: const Icon(Icons.local_bar),
              label: const Text(Strings.goPour),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final drink = cocktail.drinks[index];
    final cocktailsProvider = Provider.of<CocktailsProvider>(context, listen: false);

    return TuningCard(
      drink: drink,
      setDrink: (UiDrink) {
        var volumeType = cocktailsProvider.getVolumeTypeByDrinkName(UiDrink.name);
        var newUiDrink = UiDrink.copyWith(volumeType: volumeType);
        context.read<TuningProvider>().updateDrink(newUiDrink);
      },
      drinks: context.watch<CocktailsProvider>().drinks,
      onDelete: (){
        context.read<TuningProvider>().removeDrink(drink.id);
      },
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }

  void startPour(BuildContext context) async {
    final provider = context.read<ConnectionProvider>();
    provider.startPour();

    showModalBottomSheet(
      context: context,
      builder: (_) => ChangeNotifierProvider.value(
        value: provider,
        child: PourModal(),
      ),
    ).whenComplete(provider.stopPour);
  }
}

class DropdownItem {
  final String name;
  final int id;

  DropdownItem(this.name, this.id);
}

class DialogHelper {
  static void showCustomDialog(
      BuildContext context, {
        required String title,
        required String hintText,
        required Function(String, int) onConfirm,
        required VoidCallback onCancel,
      }) {
    var listCocktails = context.read<TuningProvider>().userCocktails;
    List<DropdownItem> dropdownItems = [
      DropdownItem('Создать новый', -1),
      ...listCocktails.map((cocktail) => DropdownItem(cocktail.name, cocktail.id)).toList(),
    ];
    DropdownItem? selectedDropdownItem = dropdownItems[0];
    TextEditingController textEditingController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButton<DropdownItem>(
                    value: selectedDropdownItem,
                    onChanged: (DropdownItem? newValue) {
                      setState(() {
                        selectedDropdownItem = newValue;
                        if (selectedDropdownItem!.id == -1) {
                          textEditingController.clear();
                        }
                      });
                    },
                    items: dropdownItems.map<DropdownMenuItem<DropdownItem>>((DropdownItem item) {
                      return DropdownMenuItem<DropdownItem>(
                        value: item,
                        child: Text(item.name),
                      );
                    }).toList(),
                  ),
                  if (selectedDropdownItem != null && selectedDropdownItem!.id == -1)
                    TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(hintText: hintText),
                    ),
                ],
              ),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text(Strings.cancel),
                  onPressed: () {
                    onCancel();
                    Navigator.of(context).pop();
                  },
                ),
                FilledButton(
                  child: const Text(Strings.confirm),
                  onPressed: () {
                    final inputText = selectedDropdownItem!.id == -1 ? textEditingController.text : selectedDropdownItem!.name;
                    onConfirm(inputText, selectedDropdownItem!.id);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

