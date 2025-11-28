class AuthRepository {
  // Simulate a network call with a delay
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    
    // Check if credentials match the required values
    if (email == 'test@gmail.com' && password == '123456') {
      return true;
    }
    return false;
  }

  // Simulate signup process
  Future<bool> signup(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    // In a real app, we would create a new user here
    return true;
  }
}