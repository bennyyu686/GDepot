class User {
    String userName
    String password
    String email
    String phone
    String address
    static constraints = {
        userName(size:2..10,blank:false)
        password(size:6..30,blank:false)
        email(email:true,unique:true,blank:false)
        phone(matches:/\d{7,11}/,blank:false)
        address(maxSize:200,blank:false)
   }
}
