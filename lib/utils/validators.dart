class Validation{
  static String validateEmail(String value){
    if (value == null) {
      return 'Email is invalid';
    }

    const p = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regExp = RegExp(p);
    if(!regExp.hasMatch(value)){
      return 'Email is invalid';
    }

    return null;
  }

  static String validatePass(String value){
    if(value == null)
    {
      return "Password invalid";
    }
    
    if(value.length < 6)
    {
      return "Password requite minium 6 characters";
    }

    return null;
  }
}