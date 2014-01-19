package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(FacturaController)
@Mock(Factura)
class FacturaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/factura/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.facturaInstanceList.size() == 0
        assert model.facturaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.facturaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.facturaInstance != null
        assert view == '/factura/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/factura/show/1'
        assert controller.flash.message != null
        assert Factura.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/factura/list'

        populateValidParams(params)
        def factura = new Factura(params)

        assert factura.save() != null

        params.id = factura.id

        def model = controller.show()

        assert model.facturaInstance == factura
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/factura/list'

        populateValidParams(params)
        def factura = new Factura(params)

        assert factura.save() != null

        params.id = factura.id

        def model = controller.edit()

        assert model.facturaInstance == factura
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/factura/list'

        response.reset()

        populateValidParams(params)
        def factura = new Factura(params)

        assert factura.save() != null

        // test invalid parameters in update
        params.id = factura.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/factura/edit"
        assert model.facturaInstance != null

        factura.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/factura/show/$factura.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        factura.clearErrors()

        populateValidParams(params)
        params.id = factura.id
        params.version = -1
        controller.update()

        assert view == "/factura/edit"
        assert model.facturaInstance != null
        assert model.facturaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/factura/list'

        response.reset()

        populateValidParams(params)
        def factura = new Factura(params)

        assert factura.save() != null
        assert Factura.count() == 1

        params.id = factura.id

        controller.delete()

        assert Factura.count() == 0
        assert Factura.get(factura.id) == null
        assert response.redirectedUrl == '/factura/list'
    }
}
