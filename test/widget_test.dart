import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watch_tech_now/presentation/app.dart';

void main() {
  testWidgets('shows the app title', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: WatchTechNowApp()));

    expect(find.text('Watch Tech Now'), findsOneWidget);
  });
}
