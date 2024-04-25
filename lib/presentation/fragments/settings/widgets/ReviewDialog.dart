import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/config.dart';
import '../../../../core/theme.dart';
import '../../../../domain/repository/config.dart';
import '../../../strings.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(Strings.reviewTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            const Text(Strings.reviewText),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.greenButton, // Зелёный цвет кнопки
              ),
              onPressed: () => launchUrls(), // Функция перехода по ссылке
              child: const Text(Strings.reviewButton),
            ),
          ],
        ),
      ),
    );
  }

  void launchUrls() async {
    try {
      final configRepository = GetIt.I.get<ConfigRepository>();
      AppConfig config = await configRepository.getConfig();
      final url = config.urlGoogle;

      if (url != null) {
        final uri = Uri.parse(url);
          await launchUrl(uri);
      } else {
        print('URL is null');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
