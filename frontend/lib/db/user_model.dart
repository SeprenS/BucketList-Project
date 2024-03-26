class User{
  String email;
  String password;
  String nickName;
  User(this.email, this.nickName, this.password);

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "email": email,
      "password": password
    };
  }

}