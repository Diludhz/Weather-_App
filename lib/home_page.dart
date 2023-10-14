import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_prg1/weatherdata_fetch.dart';

var dayinfo = DateTime.now();
var dateFormat = DateFormat('EEEE,d MMM,yyyy').format(dayinfo);

class MyHomePage extends StatelessWidget {
  var client = WeatherData();
  var data;

  MyHomePage({super.key});

  info() async {
    //  var position = await GetPosition();
    data = await client.getData("51.52", "-0.11");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: ((context, snapshot) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80),
              height: size.height * 0.75,
              width: size.width,
              margin: const EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff955cd1),
                    Color(0xFF3FA2FA),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.85],
                ),
              ),
              child: Column(
                children: [
                  Text('${data?.cityName}',
                      style: GoogleFonts.hubballi(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w900,
                        fontSize: 45,
                      )),
                  const SizedBox(height: 7),
                  Text(dateFormat,
                      style: GoogleFonts.hubballi(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                      )),
                  const SizedBox(height: 30),
                  Image.network(
                    'https:${data?.icon}',
                    width: size.width * 0.3,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 7),
                  Text('${data?.condition}',
                      style: GoogleFonts.hubballi(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 83,
                      )),
                  const SizedBox(height: 10),
                  Text('${data?.temp}',
                      style: GoogleFonts.hubballi(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 60,
                      )),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset("assets/icons/icons8-storm-64.png",
                              width: size.width * 0.15),
                          Text(
                            '${data?.wind} km/h',
                            style: GoogleFonts.hubballi(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Wind",
                            style: GoogleFonts.mavenPro(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset("assets/icons/icons8-storm-64.png",
                              width: size.width * 0.15),
                          Text(
                            '${data?.humidity}',
                            style: GoogleFonts.hubballi(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Humidity",
                            style: GoogleFonts.mavenPro(
                                fontSize: 16,
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset("assets/icons/wind_direction.png",
                                width: size.width * 0.15),
                            Text(
                              '${data?.wind_dir}',
                              style: GoogleFonts.hubballi(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Strom",
                              style: GoogleFonts.mavenPro(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Gust",
                      style: GoogleFonts.mavenPro(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.gust}kp/h',
                      style: GoogleFonts.hubballi(
                          color: Colors.white, fontSize: 23),
                    ),
                    const SizedBox(height: 35),
                    Text(
                      "Pressure",
                      style: GoogleFonts.mavenPro(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.pressure} hpa',
                      style: GoogleFonts.hubballi(
                          color: Colors.white, fontSize: 23),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "UV",
                      style: GoogleFonts.mavenPro(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.uv}',
                      style: GoogleFonts.hubballi(
                          color: Colors.white, fontSize: 23),
                    ),
                    const SizedBox(height: 35),
                    Text(
                      "Priciptation",
                      style: GoogleFonts.mavenPro(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.pricipe}',
                      style: GoogleFonts.hubballi(
                          color: Colors.white, fontSize: 23),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Wind",
                      style: GoogleFonts.mavenPro(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.wind} km/h',
                      style: GoogleFonts.hubballi(
                          color: Colors.white, fontSize: 23),
                    ),
                    const SizedBox(height: 35),
                    Text(
                      "Last update",
                      style: GoogleFonts.mavenPro(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.last_update}',
                      style: GoogleFonts.hubballi(
                          color: Colors.white, fontSize: 23),
                    )
                  ],
                ))
              ],
            )
          ],
        );
      }),
    ));
  }
}
