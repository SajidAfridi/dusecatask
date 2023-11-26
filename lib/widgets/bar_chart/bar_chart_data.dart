import 'indivisual_bar.dart';

class BarData{
  final double monEarning;
  final double tueEarning;
  final double wedEarning;
  final double thuEarning;
  final double friEarning;
  final double satEarning;
  final double sunEarning;

  BarData({
    required this.monEarning,
    required this.tueEarning,
    required this.wedEarning,
    required this.thuEarning,
    required this.friEarning,
    required this.satEarning,
    required this.sunEarning,
  });

  List<IndividualBar>barData = [];

  //initializing the bar data
  void initBarData(){
    barData = [
      IndividualBar(x: 1, y: satEarning),
      IndividualBar(x: 2, y: sunEarning),
      IndividualBar(x: 3, y: monEarning),
      IndividualBar(x: 4, y: tueEarning),
      IndividualBar(x: 5, y: wedEarning),
      IndividualBar(x: 6, y: thuEarning),
      IndividualBar(x: 7, y: friEarning),

    ];
  }
}