import 'package:erandevu/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts with splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const RandevumApp());
    
    expect(find.text('eRandevu'), findsOneWidget);
    expect(find.text('Appointment Management'), findsOneWidget);
  });
}
