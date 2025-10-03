import 'package:flutter_test/flutter_test.dart';
import 'package:randevum/main.dart';

void main() {
  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const RandevumApp());
    
    expect(find.text('Randevum'), findsOneWidget);
    expect(find.text('Appointment Management'), findsOneWidget);
  });
}
