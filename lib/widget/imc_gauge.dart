import 'package:flutter/material.dart';
import 'package:maximc/widget/imc_componetes.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauge extends StatelessWidget {
  final double imc;

  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRanger(
              color: Colors.blue,
              start: 12.5,
              end: 18.5,
              label: 'MAGREZA',
            ),
            ImcGaugeRanger(
              color: Colors.green,
              start: 18.5,
              end: 24.9,
              label: 'NORMAL',
            ),
            ImcGaugeRanger(
              color: Colors.yellowAccent,
              start: 25.0,
              end: 32.9,
              label: 'SOBREPESO',
            ),
            ImcGaugeRanger(
              color: Colors.red[500]!,
              start: 32.9,
              end: 39.9,
              label: 'OBESIDADE',
            ),
            ImcGaugeRanger(
              color: Colors.red[900]!,
              start: 39.9,
              end: 47.9,
              label: 'OBESIDADE GRAVE',
            ),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        )
      ],
    );
  }
}
