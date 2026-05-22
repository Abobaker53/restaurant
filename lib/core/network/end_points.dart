abstract class EndPoints{
  static const String baseUrl = 'https://nti-ecommerce-api-production-8291.up.railway.app/api/';
  static const String login = 'login';
  static const String register = 'register';
  static const String refresh = 'refresh_token';
  static const String myTasks = 'my_tasks';
  static const String newTask = 'new_task';
  static String updateTask({required int? taskId}) => 'tasks/$taskId';

}