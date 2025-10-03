class ApiEndpoints {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8000/api',
  );
  
  // Auth
  static const String login = '/auth/login';
  
  // Appointments
  static const String appointmentsByDate = '/appointments';
}
