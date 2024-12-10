import 'package:paypilot/flavor_config.dart';
import 'package:paypilot/main_common.dart';

void main() async {
  FlavorConfig.environment = Environment.dev;
  FlavorConfig.paypilotPlatformAPI = 'https://test-app.paypilot.io/api';
  FlavorConfig.sentryDSN =
      'https://d2626bcc0a88406a84f042d3c4ccec2c@o4504259038543872.ingest.sentry.io/4504259556868096';

  await mainCommon();
}
