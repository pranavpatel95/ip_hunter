import 'package:flutter/material.dart';
import 'package:ip_hunter/ip_hunter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _ipHunterPlugin = IpHunter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ip Hunter example'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: _ipHunterPlugin.getPublicIPAddress(), // async work
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Text('Loading....');
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ip address: ${snapshot.data}',
                            style: const TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FutureBuilder<String>(
                            future: _ipHunterPlugin.getCity(), // async work
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Text('Loading....');
                                default:
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return Text(
                                      'City: ${snapshot.data}',
                                      style: const TextStyle(fontSize: 17),
                                    );
                                  }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FutureBuilder<String>(
                            future: _ipHunterPlugin.getRegion(), // async work
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Text('Loading....');
                                default:
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return Text(
                                      'Region: ${snapshot.data}',
                                      style: const TextStyle(fontSize: 17),
                                    );
                                  }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FutureBuilder<String>(
                            future: _ipHunterPlugin.getCountry(), // async work
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Text('Loading....');
                                default:
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return Text(
                                      'Country: ${snapshot.data}',
                                      style: const TextStyle(fontSize: 17),
                                    );
                                  }
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
