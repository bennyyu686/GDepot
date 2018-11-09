class GoodsController {

        static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

        def index = {
        redirect(action: "list", params: params)
        }

        def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        //[goodsInstanceList: Goods.list(params), goodsInstanceTotal: Goods.count()]
            [ goodsInstanceList: new grails.orm.PagedResultList( Goods.list( params ) , Goods.count() ) ]

        }
        def create = {
            def goodsInstance = new Goods()
            goodsInstance.properties = params
            return [goodsInstance: goodsInstance]
        }

        def save = {
            def goodsInstance = new Goods(params)
            if (goodsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'goods.label', default: 'Goods'), goodsInstance.id])}"
                redirect(action: "show", id: goodsInstance.id)
            } else {
                render(view: "create", model: [goodsInstance: goodsInstance])
            }
        }

        def show = {
            def goodsInstance = Goods.get(params.id)
            if (!goodsInstance) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])}"
                redirect(action: "list")
            } else {
                [goodsInstance: goodsInstance]
            }
        }

        def edit = {
            def goodsInstance = Goods.get(params.id)
            if (!goodsInstance) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])}"
                redirect(action: "list")
            } else {
                return [goodsInstance: goodsInstance]
            }
        }

        def update = {
            def goodsInstance = Goods.get(params.id)
            if (goodsInstance) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (goodsInstance.version > version) {

                        goodsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'goods.label', default: 'Goods')] as Object[], "Another user has updated this Goods while you were editing")
                        render(view: "edit", model: [goodsInstance: goodsInstance])
                        return
                    }
                }
                goodsInstance.properties = params
                if (!goodsInstance.hasErrors() && goodsInstance.save(flush: true)) {
                    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'goods.label', default: 'Goods'), goodsInstance.id])}"
                    redirect(action: "show", id: goodsInstance.id)
                } else {
                    render(view: "edit", model: [goodsInstance: goodsInstance])
                }
            } else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])}"
                redirect(action: "list")
            }
        }

        def delete = {
            def goodsInstance = Goods.get(params.id)
            if (goodsInstance) {
                try {
                    goodsInstance.delete(flush: true)
                    flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])}"
                    redirect(action: "list")
                }
                catch (org.springframework.dao.DataIntegrityViolationException e) {
                    flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])}"
                    redirect(action: "show", id: params.id)
                }
            } else {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'goods.label', default: 'Goods'), params.id])}"
                redirect(action: "list")
            }
        }

        def searchForm = { }

    def search = {
        //[goods:new Goods(params)]
        if(!params.max) params.max = 1

        def searchClosure = {
            if(params.categoryName) {
                category{
                    eq('categoryName', params.categoryName)
                }
            }
            if(params.title) {
                like('title',"%${params.title}%")
            }
            if(params.price1) {
                ge('price',new BigDecimal (params.price1))
            }
            if(params.price2) {
                le('price',new BigDecimal (params.price2))
            }
            if(params.description) {
                like('description', "%${params.description}%")
            }

        }

        def c = Goods.createCriteria()
        def goods = c.list( params, searchClosure )
        def goodsCount = goods.totalCount
        //goodsCount = goods.totalCount
        println goods
        println goodsCount
        render(view:'list',model:[goodsInstanceList:goods,goodsCount:goodsCount])

    }


}
