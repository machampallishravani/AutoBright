import 'package:auto_bright/utils/asset_img.dart';
import 'package:auto_bright/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ThermoStatUi extends StatefulWidget {
  const ThermoStatUi({super.key});

  @override
  State<ThermoStatUi> createState() => _ThermoStatUiState();
}

class _ThermoStatUiState extends State<ThermoStatUi> {
  bool powerEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Thermostat',
              style: TextStyle(
                color: Color(0xFF0F172A),
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AssetSvg.edit,
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  AssetSvg.delete,
                )
              ],
            )
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            width: 400,
            height: 812,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: getpowerbuttonstatus("color check")
                      ? [Color(0x00E1EEFF), Color(0xFFB4D5FF)]
                      : [Color(0x00FCFDFF), Color(0x00ECF4FF)]),
            ),
            alignment: Alignment.topCenter,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text.rich(
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
                  const Text.rich(
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
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          width: 264,
                          height: 264,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Container(
                        width: 255.05,
                        height: 255.05,
                        // color: Colors.pink,
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.3,
                              cornerStyle: CornerStyle.bothCurve,
                            
                            gradient: getpowerbuttonstatus("color radial color")
            ? const SweepGradient(
                colors: [Color(0xFF4C24FB), Color(0xFF46B2E3)],
                startAngle: 0,
                endAngle: 0.0001, // Use a very small angle to mimic a solid color
              )
            : const SweepGradient(
                colors: 
                 [Color(0xFFC9D9E8), Color(0xFF7FA4C7)]
                ,
                startAngle: 0,
                endAngle: 0.0001,
              ),
        thicknessUnit: GaugeSizeUnit.factor,
        color: getpowerbuttonstatus("color radial color")
            ? Color.fromARGB(70, 8, 8, 5)
            : Color.fromARGB(30, 0, 169, 181),
                            ),
                          )
                        ]),
                      ),
                      Positioned(
                        left: 90.40,
                        top: 90.40,
                        child: GestureDetector(
                          onTap: () {
                            powerEnabled = !powerEnabled;
                            getpowerbuttonstatus(
                                "onpressed status before setstate");

                            setState(() {});
                            getpowerbuttonstatus("onpressed status");
                          },
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: const ShapeDecoration(
                              color: Colors.yellow,
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
                            child: Stack(children: [
                              SvgPicture.asset(
                                AssetSvg.power,
                              )
                            ]),
                          ),
                        ),
                      ),
                      /* ========================= dot on the progress bar ====================*/
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
                  const Text(
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
                  const Text(
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
                  //               Positioned(
                  // left: 0,
                  // top: 500,
                  // child: Container(
                  //   height: 400,
                  //  color: Colors.transparent,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       // Transform.flip(
                  //       //   flipX: true,
                  //       //   child: Image.asset(
                  //       //             AssetImages.vector,
                  //       //             fit: BoxFit.cover,

                  //       //           ),
                  //       // ),
                  //       Container(
                  //         width: 166,
                  //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  //         decoration: ShapeDecoration(
                  //           color: Colors.white,
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(8)),
                  //             shadows: const [
                  //               BoxShadow(
                  //                 color: Color(0x28000000),
                  //                 blurRadius: 4,
                  //                 offset: Offset(0, 2),
                  //                 spreadRadius: 0,
                  //               )
                  //             ],
                  //           ),
                  //           child: Row(
                  //             mainAxisSize: MainAxisSize.min,
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Container(
                  //                 width: 24,
                  //                 height: 24,
                  //                 clipBehavior: Clip.antiAlias,
                  //                 decoration: const BoxDecoration(),
                  //                 child: Stack(children: [
                  //                   SvgPicture.asset(
                  //                     AssetSvg.mode,
                  //                   )
                  //                 ]),
                  //               ),
                  //               const Expanded(
                  //                 child: Column(
                  //                   mainAxisSize: MainAxisSize.min,
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     SizedBox(
                  //                       width: 83,
                  //                       child: Text(
                  //                         'Mode',
                  //                         style: TextStyle(
                  //                           color: Color(0xFF0F172A),
                  //                           fontSize: 16,
                  //                           fontFamily: 'Montserrat',
                  //                           fontWeight: FontWeight.w500,
                  //                           height: 0,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     SizedBox(
                  //                       width: 83,
                  //                       child: Text(
                  //                         'Auto',
                  //                         style: TextStyle(
                  //                           color: Color(0xFF475569),
                  //                           fontSize: 12,
                  //                           fontFamily: 'Montserrat',
                  //                           fontWeight: FontWeight.w400,
                  //                           height: 0,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         // Image.asset(
                  //         //           AssetImages.vector,
                  //         //           fit: BoxFit.cover,
                  //         //           // width: double.infinity,
                  //         //           // height: double.infinity,
                  //         //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ]),
          ),
        ],
      ),
    );
  }

  bool getpowerbuttonstatus(String msg) {
    print("power button $msg $powerEnabled");
    return powerEnabled;
  }
}
