abstract class AuthRepository {
  Future<String?> getAuthToken(String tenantId, String tenantPassword);

  Future<String?> getPolicies(String token);
}
