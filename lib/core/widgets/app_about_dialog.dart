import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zone/core/config/app_constants.dart';

class AppAboutDialog extends StatelessWidget {
  const AppAboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Image.asset(
            'assets/images/splash.png',
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 16),
          const Expanded(child: Text(AppConstants.appName)),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SelectableText(AppConstants.appFullDescription),
          const SizedBox(height: 16),
          const SelectableText(AppConstants.appDisclaimer),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              launchUrl(Uri.parse(AppConstants.appRepo));
            },
            child: const Text('Source Code'),
          ),
          OutlinedButton(
              onPressed: () {
                launchUrl(Uri.parse(AppConstants.appPrivacyPolice));
              },
              child: const Text('Privacy Policy')),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: 'Contact me: '),
                TextSpan(
                  text: AppConstants.appEmail,
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                          Uri(scheme: 'mailto', path: AppConstants.appEmail));
                    },
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const LicensePage(
                  applicationName: AppConstants.appName,
                ),
              ),
            );
          },
          child: Text(
            MaterialLocalizations.of(context).viewLicensesButtonLabel,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(MaterialLocalizations.of(context).closeButtonLabel),
        ),
      ],
    );
  }
}
