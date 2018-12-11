import 'dart:async';

// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('ensure text test', () {
    FlutterDriver driver;

    setUpAll(() async {
      // Connects to the app
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        // Closes the connection
        driver.close();
      }
    });

    test('measure', () async {
      // Record the performance timeline of things that happen inside the closure
      Timeline timeline = await driver.traceAction(() async {
        // Find the scrollable user list

        SerializableFinder userList = find.text('0');
        expect(userList.finderType, 'ByText');
        expect(userList.serialize()['text'], '0');
      });

      // The `timeline` object contains all the performance data recorded during
      // the scrolling session. It can be digested into a handful of useful
      // aggregate numbers, such as "average frame build time".
      // TimelineSummary summary = TimelineSummary.summarize(timeline);

      // The following line saves the timeline summary to a JSON file.
      // summary.writeSummaryToFile('scrolling_performance', pretty: true);

      // The following line saves the raw timeline data as JSON.
      // summary.writeTimelineToFile('scrolling_performance', pretty: true);
    });
  });
}
