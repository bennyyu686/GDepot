class Category1Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [category1InstanceList: Category1.list(params), category1InstanceTotal: Category1.count()]
    }

    def create = {
        def category1Instance = new Category1()
        category1Instance.properties = params
        return [category1Instance: category1Instance]
    }

    def save = {
        def category1Instance = new Category1(params)
        if (category1Instance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'category1.label', default: 'Category1'), category1Instance.id])}"
            redirect(action: "show", id: category1Instance.id)
        }
        else {
            render(view: "create", model: [category1Instance: category1Instance])
        }
    }

    def show = {
        def category1Instance = Category1.get(params.id)
        if (!category1Instance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category1.label', default: 'Category1'), params.id])}"
            redirect(action: "list")
        }
        else {
            [category1Instance: category1Instance]
        }
    }

    def edit = {
        def category1Instance = Category1.get(params.id)
        if (!category1Instance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category1.label', default: 'Category1'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [category1Instance: category1Instance]
        }
    }

    def update = {
        def category1Instance = Category1.get(params.id)
        if (category1Instance) {
            if (params.version) {
                def version = params.version.toLong()
                if (category1Instance.version > version) {
                    
                    category1Instance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'category1.label', default: 'Category1')] as Object[], "Another user has updated this Category1 while you were editing")
                    render(view: "edit", model: [category1Instance: category1Instance])
                    return
                }
            }
            category1Instance.properties = params
            if (!category1Instance.hasErrors() && category1Instance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'category1.label', default: 'Category1'), category1Instance.id])}"
                redirect(action: "show", id: category1Instance.id)
            }
            else {
                render(view: "edit", model: [category1Instance: category1Instance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category1.label', default: 'Category1'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def category1Instance = Category1.get(params.id)
        if (category1Instance) {
            try {
                category1Instance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'category1.label', default: 'Category1'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'category1.label', default: 'Category1'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category1.label', default: 'Category1'), params.id])}"
            redirect(action: "list")
        }
    }
}
