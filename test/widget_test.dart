import 'package:flutter_test/flutter_test.dart';
import 'package:disney_plus_mobile/main.dart';

void main() {
  testWidgets('La pantalla principal muestra la suscripción', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const DisneyLandingApp());
    expect(find.text('SUSCRÍBETE AHORA'), findsOneWidget);
  });
}
