part of "injection_container.dart";

Dio _buildDioClient(String base) {
  final options = BaseOptions(
    baseUrl: base,
  );
  final dio = Dio(options);
  final talker = TalkerFlutter.init();
  dio.interceptors.add(TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true, printResponseHeaders: true),
      talker: talker));
  return dio;
}
