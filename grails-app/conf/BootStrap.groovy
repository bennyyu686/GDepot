
class BootStrap {

     def init = { servletContext ->

          def category = new Category1(categoryName:'Book')
          if(category.save()){
               println 'new category saved!'
               def allgoods = [ new Goods(title:'Grails',price:20.0,description:'Grails Book...',photoUrl:""),
                                new Goods(title:'Groovy',price:20.0,description:'Groovy Book.',photoUrl:"")]
             allgoods*.category = category
              allgoods*.save()
               if(allgoods[0].hasErrors()) {
                    allgoods[0].errors.allErrors.each {
                         println it
                    }

               }
               println 'all goods saved!'
         }

     }
     def destroy = {
     }
} 