enum Environment { dev, prod }

class FlavorConfig {
  static late final Environment environment;
  static late final String paypilotPlatformAPI;
  static late final String sentryDSN;
}
