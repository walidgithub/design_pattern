class InfoLogger extends LoggerBase {
  late ExternalLoggingService externalLoggingService;

  InfoLogger(
      LogBloc logBloc, {
        super.nextLogger,
      })  : externalLoggingService = ExternalLoggingService(logBloc),
        super(logLevel: LogLevel.Info);

  @override
  void log(String message) {
    externalLoggingService.logMessage(logLevel, message);
  }
}