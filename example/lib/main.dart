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
            future: IpHunter.getPublicIPAddress(), // async work
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
                            future: IpHunter.getCity(), // async work
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
                            future: IpHunter.getRegion(), // async work
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
                            future: IpHunter.getCountry(), // async work
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
                          const SizedBox(
                            height: 20,
                          ),
                          FutureBuilder<String>(
                            future: IpHunter.getCountryCode(), // async work
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
                                      'Country Code: ${snapshot.data}',
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
                            future: IpHunter.getCurrency(), // async work
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
                                      'Currency: ${snapshot.data}',
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
                            future: IpHunter.getIpType(), // async work
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
                                      'IP type: ${snapshot.data}',
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
