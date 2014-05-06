package salias

class IndexController {

    def about() { }

    def renderString() {
        render "Hello, this is a rendered string."
    }

    def renderPage() {
    }

    def renderView() {
        render (view:'renderView')
    }

    def renderTemplate() {
        render (template: 'renderTemplate')
    }

    def withIdParam() {
        def id = params.id
        render "The ID given is ${id}"
    }

    def withCustomParam() {
        def a = params.a.toInteger()
        def b = params.b.toInteger()
        render "${a} + ${b} = ${a+b}"
    }
    
    def index(){
        
    }
}
