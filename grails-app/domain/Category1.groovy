class Category1 {
    String categoryName
    static hasMany = [goods:Goods]
    static constraints = {
        categoryName(unique:true)
    }
}
