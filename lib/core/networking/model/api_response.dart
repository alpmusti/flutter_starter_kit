class APIResponse {
  bool isSuccess;
  dynamic data;

  APIResponse({
    this.data,
    this.isSuccess = false,
  });
}
