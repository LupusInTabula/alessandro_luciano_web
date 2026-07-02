import 'package:flutter_test/flutter_test.dart';

import 'package:alessandro_luciano_site/main.dart';
import 'package:alessandro_luciano_site/content/company_content.dart';

void main() {
  testWidgets('Home page shows company name and hero title', (WidgetTester tester) async {
    await tester.pumpWidget(const AlessandroLucianoApp());
    await tester.pumpAndSettle();

    expect(find.text(CompanyContent.companyName), findsWidgets);
    expect(find.textContaining('Riparazione e Commercio'), findsOneWidget);
  });
}
