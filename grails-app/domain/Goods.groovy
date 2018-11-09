
class Goods {
    String title
    String description
    BigDecimal price
    String photoUrl
    Category1 category
    static mapping={
        cache usage:'read-write'
    }
}
