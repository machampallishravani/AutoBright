import 'package:auto_bright/utils/asset_img.dart';
import 'package:auto_bright/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AutoBright extends StatefulWidget {
  const AutoBright({super.key});

  @override
  State<AutoBright> createState() => _AutoBrightState();
}

class _AutoBrightState extends State<AutoBright> {
  ValueNotifier<double> progressNotifier = ValueNotifier<double>(0.0);
  bool powerEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Colors.white, Color(0xFFF5FAFF)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 112,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 700,
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.00, -1.00),
                  end: Alignment(0, 1),
                //  colors: [Color(0x00E1EEFF), Color(0xFFB4D5FF)],
               colors: getpowerbuttonstatus("color check") ? [Color(0x00E1EEFF), Color(0xFFB4D5FF)] : [Color(0x00FCFDFF), Color(0x00ECF4FF)] 
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 500,
            child: Container(
              height: 400,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      
                      AssetImages.vector,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 166,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x28000000),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Stack(children: [
                            SvgPicture.asset(
                              AssetSvg.mode,
                            )
                          ]),
                        ),
                        const Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 83,
                                child: Text(
                                  'Mode',
                                  style: TextStyle(
                                    color: Color(0xFF0F172A),
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 83,
                                child: Text(
                                  'Auto',
                                  style: TextStyle(
                                    color: Color(0xFF475569),
                                    fontSize: 12,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AssetImages.vector,
                    fit: BoxFit.cover,
                    // width: double.infinity,
                    // height: double.infinity,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 88,
            child: Container(
              alignment: Alignment.topCenter,
              width: 343,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Room Temperature is ',
                                style: TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '24°C ',
                                style: TextStyle(
                                  color: Color(0xFF0F172A),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Room Humidity is ',
                                style: TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Dry',
                                style: TextStyle(
                                  color: Color(0xFF0F172A),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 56,
            top: 214,
            child: Container(
              width: 264,
              height: 264,
              child: Stack(
                children: [
                  Positioned(
                    left: 65,
                    top: 32,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Center(
                      child: Container(
                        width: 264,
                        height: 264,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x91C9D9E8),
                              blurRadius: 16,
                              offset: Offset(4, 8),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 96,
                    top: 96,
                    child: SizedBox(
                      width: 72,
                      height: 72,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 72,
                              height: 72,
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x19C9D9E8),
                                    blurRadius: 16,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 14.40,
                            top: 14.40,
                            child: Container(
                            
                              width: 43.20,
                              height: 43.20,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(color: Colors.pink),
                              child: SvgPicture.asset(
                                AssetSvg.power,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 4.47,
                    top: 4.47,
                    child: Container(
                      width: 255.05,
                      height: 255.05,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: 100,
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.3,
                            cornerStyle: CornerStyle.bothCurve,
                            color: Color.fromARGB(30, 0, 169, 181),
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: progressNotifier.value,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 0.3,
                              sizeUnit: GaugeSizeUnit.factor,
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  Positioned(
                    left: 46,
                    top: 199,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 143.25,
            top: 521,
            child: Container(
              width: 88.37,
              height: 73.83,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '16°C',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0F172A),
                      fontSize: 32,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    'Temperature',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 375,
                    height: 64,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 16,
                          top: 29,
                          child: Container(
                            width: 343,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: Stack(children: [
                                          SvgPicture.asset(
                                            AssetSvg.left,
                                          )
                                        ]),
                                      ),
                                      const SizedBox(width: 8),
                                      const SizedBox(
                                        width: 209,
                                        child: Text(
                                          'Thermostat',
                                          style: TextStyle(
                                            color: Color(0xFF0F172A),
                                            fontSize: 18,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // const SizedBox(width: 48),
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                  child: Stack(children: [
                                    SvgPicture.asset(
                                      AssetSvg.edit,
                                    )
                                  ]),
                                ),
                                // const SizedBox(width: 48),
                                Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(children: [
                                    SvgPicture.asset(
                                      AssetSvg.delete,
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  bool getpowerbuttonstatus (String msg){
    print("power button $msg $powerEnabled" );
    return powerEnabled;
  }
}
