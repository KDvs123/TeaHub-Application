import 'package:TeaHub/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Set border radius

        border: Border.all(
          color: Theme.of(context).colorScheme.primary, // Set border color
          width: 0.5, // Set border width
        ),

        color: Theme.of(context).colorScheme.tertiary,
      ),

      //color: Theme.of(context).colorScheme.primary,
      // width: 100, // Set the desired width of the dropdown button
      // height: 40,
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return DropdownButton<String>(
            value: provider.currentTheme,
            padding: EdgeInsets.only(left: 8),
            dropdownColor: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
            icon: Icon(Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.primary,
                size: 30), // Add dropdown icon
            underline: Container(
              // Remove underline
              height: 0,
            ),

            items: [
              DropdownMenuItem<String>(
                value: 'light',
                child: Text(
                  'Light',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary, // Set text color
                    fontSize: 18, // Set font size
                  ),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'dark',
                child: Text(
                  'Dark',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary, // Set text color
                    fontSize: 18, // Set font size
                  ),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'system',
                child: Text(
                  'System',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary, // Set text color
                    fontSize: 18, // Set font size
                  ),
                ),
              ),
            ],
            onChanged: (String? value) {
              provider.changeTheme(value ?? 'system');
            },
          );
        },
      ),
    );
  }
}
