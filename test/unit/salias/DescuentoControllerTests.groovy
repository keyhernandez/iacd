package salias



import org.junit.*
import grails.test.mixin.*

@TestFor(DescuentoController)
@Mock(Descuento)
class DescuentoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/descuento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.descuentoInstanceList.size() == 0
        assert model.descuentoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.descuentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.descuentoInstance != null
        assert view == '/descuento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/descuento/show/1'
        assert controller.flash.message != null
        assert Descuento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/descuento/list'

        populateValidParams(params)
        def descuento = new Descuento(params)

        assert descuento.save() != null

        params.id = descuento.id

        def model = controller.show()

        assert model.descuentoInstance == descuento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/descuento/list'

        populateValidParams(params)
        def descuento = new Descuento(params)

        assert descuento.save() != null

        params.id = descuento.id

        def model = controller.edit()

        assert model.descuentoInstance == descuento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/descuento/list'

        response.reset()

        populateValidParams(params)
        def descuento = new Descuento(params)

        assert descuento.save() != null

        // test invalid parameters in update
        params.id = descuento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/descuento/edit"
        assert model.descuentoInstance != null

        descuento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/descuento/show/$descuento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        descuento.clearErrors()

        populateValidParams(params)
        params.id = descuento.id
        params.version = -1
        controller.update()

        assert view == "/descuento/edit"
        assert model.descuentoInstance != null
        assert model.descuentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/descuento/list'

        response.reset()

        populateValidParams(params)
        def descuento = new Descuento(params)

        assert descuento.save() != null
        assert Descuento.count() == 1

        params.id = descuento.id

        controller.delete()

        assert Descuento.count() == 0
        assert Descuento.get(descuento.id) == null
        assert response.redirectedUrl == '/descuento/list'
    }
}
