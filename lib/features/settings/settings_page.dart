import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/app_states/theme_state.dart';

// StatelessWidget because settings page doesn't manage its own state
// Theme state is managed by ThemeState provider
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<ThemeState>();

    return Container(
        color: themeState.currentTheme.colorScheme.primaryContainer,
        // Padding provides space around the content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // Align children to the start (left) of the column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card widget to group theme mode toggle
              Card(
                // SwitchListTile combines a switch and a label
                child: SwitchListTile(
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Switch between light and dark themes'),
                  // Watch current theme state using Provider
                  value: context.watch<ThemeState>().isDarkTheme,
                  // Toggle theme when switch is changed
                  onChanged: (_) {
                    // Read (not watch) to call the toggle method
                    context.read<ThemeState>().toggleTheme();
                  },
                ),
              ),
          
              // Spacing between sections
              const SizedBox(height: 20),
          
              // Section title for color selection
              Text(
                'Theme Color',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
          
              // Wrap allows flexible layout of color options
              Wrap(
                // Space between color chips
                spacing: 10,
                runSpacing: 10,
                children: [
                  // Create color option chips
                  _buildColorOption(context, Colors.blue, 'Blue'),
                  _buildColorOption(context, Colors.green, 'Green'),
                  _buildColorOption(context, Colors.red, 'Red'),
                  _buildColorOption(context, Colors.purple, 'Purple'),
                  _buildColorOption(context, Colors.orange, 'Orange'),
                ],
              ),
          
              const SizedBox(height: 20),
          
              // Custom color section title
              Text(
                'Custom Color',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
          
              // Call method to build custom color picker
              _buildCustomColorPicker(context),
            ],
          ),
        )
        // )
        );
  }

  // Method to create color selection chips
  Widget _buildColorOption(
      BuildContext context, Color color, String colorName) {
    // Get current theme state
    final themeState = context.watch<ThemeState>();

    // Check if this color is currently selected
    final isSelected = themeState.seedColor == color;

    // ChoiceChip provides a tappable, selectable chip
    return ChoiceChip(
      label: Text(colorName),
      // Shows as selected if it matches current theme color
      selected: isSelected,
      // Background color with some transparency
      backgroundColor: color.withOpacity(0.3),
      // Darker color when selected
      selectedColor: color.withOpacity(0.7),
      // Update theme color when selected
      onSelected: (_) {
        context.read<ThemeState>().setSeedColor(color);
      },
    );
  }

  // Method to build custom color input
  Widget _buildCustomColorPicker(BuildContext context) {
    // Get current theme state
    final themeState = context.watch<ThemeState>();

    return Row(
      children: [
        // Expanded allows text field to take available space
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter Hex Color (e.g., #FF5733)',
              // Rounded border for the input
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Handle color input when submitted
            onSubmitted: (value) {
              try {
                // Convert hex string to Color
                // Remove # if present and add full opacity
                final color = Color(
                    int.parse(value.replaceFirst('#', ''), radix: 16) +
                        0xFF000000);

                // Update theme with new color
                context.read<ThemeState>().setSeedColor(color);
              } catch (e) {
                // Show error for invalid color format
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid color format. Use #RRGGBB'),
                  ),
                );
              }
            },
          ),
        ),

        // Spacing between text field and color preview
        const SizedBox(width: 10),

        // Container to show selected color
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            // Use current seed color
            color: themeState.seedColor,
            // Rounded corners
            borderRadius: BorderRadius.circular(10),
            // Light border to see color clearly
            border: Border.all(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
