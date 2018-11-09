class Student {

    String name
    String sid
    static constraints = {
         name(size:3..10)
         sid(size:3..10)
    }
}
