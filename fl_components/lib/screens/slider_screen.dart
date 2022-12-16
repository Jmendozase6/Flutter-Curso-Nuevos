import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders && Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            // divisions: 10,
            activeColor: AppTheme.primaryColor,
            value: _sliderValue,
            onChanged: _sliderEnabled
                ? (value) {
                    _sliderValue = value;
                    setState(() {});
                  }
                : null,
          ),
          // Checkbox(
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value ?? true;
          //     setState(() {});
          //   },
          // ),
          // Switch(
          //   activeColor: AppTheme.primaryColor,
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value;
          //     setState(() {});
          //   },
          // ),
          CheckboxListTile(
            activeColor: AppTheme.primaryColor,
            title: const Text('Enable Slider'),
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true;
              setState(() {});
            },
          ),
          // CupertinoSwitch(
          //   activeColor: AppTheme.primaryColor,
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value;
          //     setState(() {});
          //   },
          // ),
          SwitchListTile.adaptive(
            activeColor: AppTheme.primaryColor,
            title: const Text('Enable Slider'),
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value;
              setState(() {});
            },
          ),

          const AboutListTile(),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://static.wikia.nocookie.net/death-battle-fanon-wiki-en-espanol/images/5/59/Fcf46f73f864493aaf959b732d1605ce.png/revision/latest?cb=20190821193916&path-prefix=es'),
                width: _sliderValue,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
